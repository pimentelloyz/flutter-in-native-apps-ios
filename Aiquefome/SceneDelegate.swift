//
//  SceneDelegate.swift
//  Aiquefome
//
//  Created by André Pimentel on 22/09/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var sideMenuView: UIView?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let homeController = HomeViewControllerFactory.make()
        let flutterHomeController = FlutterHomeViewControllerFactory.make()
        setupNavigationBarItems(viewController: flutterHomeController)
        let navigationController = UINavigationController(
            rootViewController: flutterHomeController
        )
        FlutterInit.shared.navigationController = navigationController
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        setupSideMenu()
    }
    
    func setupNavigationBarItems(viewController: UIViewController) {
        let icon1 = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(icon1Tapped))
        
        let icon2 = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(icon2Tapped))
        
        let icon3 = UIBarButtonItem(image: UIImage(systemName: "person"), style: .plain, target: self, action: #selector(icon3Tapped))
        
        viewController.navigationItem.rightBarButtonItems = [icon3, icon2]
        viewController.navigationItem.leftBarButtonItem = icon1
    }
    
    @objc func icon2Tapped() {
        FlutterInit.shared.sendSessionExpiredEvent()
    }
    
    @objc func icon3Tapped() {
        print("Ícone 3 tocado")
    }
    
    @objc func icon1Tapped() {
        toggleSideMenu()
    }
    
    func setupSideMenu() {
        let menuWidth: CGFloat = (window?.frame.width ?? 0.0) * 0.85
        sideMenuView = UIView(frame: CGRect(x: -menuWidth, y: 0, width: menuWidth, height: window?.frame.height ?? 0))
        sideMenuView?.backgroundColor = UIColor.systemGray
        
        if let sideMenuView = sideMenuView {
            window?.addSubview(sideMenuView)
        }
    }
    
    func toggleSideMenu() {
        guard let sideMenuView = sideMenuView else { return }
        let isMenuVisible = sideMenuView.frame.origin.x == 0
        
        UIView.animate(withDuration: 0.3) {
            if isMenuVisible {
                sideMenuView.frame.origin.x = -sideMenuView.frame.width
            } else {
                sideMenuView.frame.origin.x = 0
            }
        }
    }
}
