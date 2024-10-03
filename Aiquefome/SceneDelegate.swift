//
//  SceneDelegate.swift
//  Aiquefome
//
//  Created by André Pimentel on 22/09/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var sideMenuView: HomeView?
    var navigationController: UINavigationController?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let flutterHomeController = FlutterHomeViewControllerFactory.make()
        flutterHomeController.view.backgroundColor = .white
        setupNavigationBarItems(viewController: flutterHomeController)
        navigationController = UINavigationController(
            rootViewController: flutterHomeController
        )
        navigationController?.navigationBar.tintColor = .purple
        FlutterInit.shared.navigationController = navigationController
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        setupSideMenu()
    }
    
    func setupNavigationBarItems(viewController: UIViewController) {
        let menuIcon = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3")?.withTintColor(.purple), style: .plain, target: self, action: #selector(menuTaped))
        let searchIcon = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass")?.withTintColor(.purple), style: .plain, target: self, action: #selector(searchTaped))
        let chatIcon = UIBarButtonItem(image: UIImage(systemName: "bubble.left.and.bubble.right")?.withTintColor(.purple), style: .plain, target: self, action: #selector(chatTaped))
        
        viewController.navigationController?.navigationBar.tintColor = .purple
        viewController.navigationItem.rightBarButtonItems = [chatIcon, searchIcon]
        viewController.navigationItem.leftBarButtonItem = menuIcon
    }
    
    @objc func searchTaped() {
        FlutterInit.shared.sendSessionExpiredEvent()
    }
    
    @objc func chatTaped() {
        navigationController?.pushViewController(FlutterInit.shared.getOrderViewController(), animated: true)
    }
    
    @objc func menuTaped() {
        toggleSideMenu()
    }
    
    func setupSideMenu() {
        let menuWidth: CGFloat = (window?.frame.width ?? 0.0)
        sideMenuView = HomeView(frame: CGRect(x: -menuWidth, y: 0, width: menuWidth, height: window?.frame.height ?? 0))
        sideMenuView?.backgroundColor = UIColor.systemGray.withAlphaComponent(0.1)
        sideMenuView?.delegate = self
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

extension SceneDelegate: HomeViewDelegate {
    func closeMenu() {
        UIView.animate(withDuration: 0.3) {
            self.sideMenuView?.frame.origin.x = -(self.sideMenuView?.frame.width ?? 1000.0)
        }
    }
}
