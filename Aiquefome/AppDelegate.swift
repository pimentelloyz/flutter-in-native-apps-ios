//
//  AppDelegate.swift
//  Aiquefome
//
//  Created by André Pimentel on 22/09/24.
//

import UIKit
import FlutterPluginRegistrant
import Flutter

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var flutterEngine = FlutterEngine(name: "AI_QUE_FOME_APP")
    // TODO: Multiplo Engine
//    lazy var flutterEngine2 = FlutterEngine(name: "AI_QUE_FOME_APP_2")

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        flutterEngine.run()
        GeneratedPluginRegistrant.register(with: self.flutterEngine)
        // TODO: Multiplo Engine
//        flutterEngine2.run()
//        GeneratedPluginRegistrant.register(with: self.flutterEngine2)
        
        return true
    }
}

