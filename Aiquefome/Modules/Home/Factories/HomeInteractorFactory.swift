//
//  HomeInteractorFactory.swift
//  Aiquefome
//
//  Created by André Pimentel on 28/09/24.
//

import Foundation

enum HomeInteractorFactory {
    static func make() -> HomeInteractor {
        return HomeInteractor()
    }
}
