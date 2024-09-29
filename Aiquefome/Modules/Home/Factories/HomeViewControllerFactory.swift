//
//  HomeViewControllerFactory.swift
//  Aiquefome
//
//  Created by André Pimentel on 28/09/24.
//

import Foundation
import UIKit

enum HomeViewControllerFactory {
    static func make() -> UIViewController {
        return HomeViewController(
            interactor: HomeInteractorFactory.make(),
            router: HomeRouterFactory.make()
        )
    }
}
