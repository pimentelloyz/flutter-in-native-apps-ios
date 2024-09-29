import UIKit
import FlutterPluginRegistrant
import Flutter

class FlutterInit {
    static let shared = FlutterInit()
    let flutterModule: FlutterViewController
    var navigationController: UINavigationController?
    var navigationChannel: FlutterMethodChannel?
    
    private init() {
        let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        flutterModule = FlutterViewController(
            engine: flutterEngine,
            nibName: nil,
            bundle: nil
        )
        navigationObserver()
    }
    
    func navigationObserver() {
        navigationChannel = FlutterMethodChannel(name: "com.example.ai_que_fome_flutter",
                                                     binaryMessenger: flutterModule.binaryMessenger)
        navigationChannel?.setMethodCallHandler { (call: FlutterMethodCall, result: FlutterResult) in
            if call.method == "router" {
                if let args = call.arguments as? [String: Any],
                   let route = args["route"] as? String {
                    let aiqfRouter = AiqfRouter(rawValue: route)
                    switch aiqfRouter {
                    case .back:
                        self.navigationController?.popViewController(animated: true)
                    case .sessionExpired:
                        self.presentUpdateTokenAlert()
                    default:
                        break
                    }
                    result(nil)
                } else {
                    result(FlutterError(code: "INVALID_ARGUMENT", message: "Expected route argument", details: nil))
                }
            }
        }
    }
    
    func sendBackNavigationEvent(backToNative: Bool = true) {
        navigationChannel?.invokeMethod(
            "router",
            arguments: [
                "route": AiqfRouter.back.rawValue,
                "backToNative": backToNative
            ]
        )
    }
    
    func sendSessionExpiredEvent() {
        navigationChannel?.invokeMethod(
            "router",
            arguments: [
                "route": AiqfRouter.sessionExpired.rawValue,
            ]
        )
    }
    
    func openMainFlutterModule() {
        navigationController?.pushViewController(flutterModule, animated: true)
        navigationController?.isNavigationBarHidden = true
        sendBackNavigationEvent()
    }
    
    func route(to route: String) {
        flutterModule.pushRoute(route)
        navigationController?.isNavigationBarHidden = true
        navigationController?.pushViewController(flutterModule, animated: true)
        sendBackNavigationEvent()
    }
    
    func presentUpdateTokenAlert() {
        let alertController = UIAlertController(title: "Atualizar Token", message: "Deseja atualizar o token?", preferredStyle: .alert)
        
        let updateAction = UIAlertAction(title: "Atualizar", style: .default) { _ in
            self.updateToken()
            alertController.dismiss(animated: true)
        }
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alertController.addAction(updateAction)
        alertController.addAction(cancelAction)
        
        if let rootViewController = navigationController?.viewControllers.first {
            rootViewController.present(alertController, animated: true, completion: nil)
        }
    }
    
    func updateToken() {
        navigationChannel?.invokeMethod(
            "router",
            arguments: [
                "route": AiqfRouter.tokenUpdated.rawValue,
            ]
        )
    }
}

enum AiqfRouter: String, CaseIterable {
    case back = "BACKTONATIVE"
    case sessionExpired = "SESSIONEXPIRED"
    case tokenUpdated = "TOKENUPDATED"
}
