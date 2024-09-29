import UIKit
import FlutterPluginRegistrant
import Flutter

class FlutterInit {
    static let shared = FlutterInit()
    let flutterModule: FlutterViewController
    
    private init() {
        let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        flutterModule = FlutterViewController(
            engine: flutterEngine,
            nibName: nil,
            bundle: nil
        )
    }
}
