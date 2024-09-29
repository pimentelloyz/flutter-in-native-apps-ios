//
//  SceneDelegate.swift
//  Aiquefome
//
//  Created by André Pimentel on 22/09/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let homeController = HomeViewControllerFactory.make()
        let navigationController = UINavigationController(
            rootViewController: homeController
        )
        FlutterInit.shared.navigationController = navigationController
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
