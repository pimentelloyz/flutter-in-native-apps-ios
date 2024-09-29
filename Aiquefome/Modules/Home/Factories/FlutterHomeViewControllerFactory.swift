//
//  FlutterHomeViewController.swift
//  Aiquefome
//
//  Created by André Pimentel on 29/09/24.
//

import Foundation
import UIKit

enum FlutterHomeViewControllerFactory {
    static func make() -> UIViewController {
        return FlutterInit.shared.flutterModule
    }
}
