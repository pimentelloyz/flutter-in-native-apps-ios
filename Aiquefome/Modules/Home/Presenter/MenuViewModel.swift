//
//  MenuViewModel.swift
//  Aiquefome
//
//  Created by André Pimentel on 30/09/24.
//

import Foundation
import UIKit

struct MenuViewModel {
    static func numbersOfRows() -> Int {
        return MenuItem.allCases.count + 1
    }
    
    static func menuItemFor(index: Int) -> MenuItem? {
        return MenuItem.allCases.first { item in
            item.rawValue == index
        }
    }
}

enum MenuItem: Int, CaseIterable {
    case phoneVefirication = 1
    case orders
    case myInfo
    case paymentMethod
    case myAddress
    case configuration
    
    var icon: UIImage? {
        switch self {
        case .phoneVefirication:
            return UIImage(named: "apple-iphone")
        case .orders:
            return UIImage(named: "book-mark")
        case .myInfo:
            return UIImage(named: "id-badges")
        case .paymentMethod:
            return UIImage(named: "credit-card-payment")
        case .myAddress:
            return UIImage(named: "info")
        case .configuration:
            return UIImage(named: "config")
        }
    }
    
    var menuTitle: String {
        switch self {
        case .phoneVefirication:
            "verificar telefone"
        case .orders:
            "meus pedidos"
        case .myInfo:
            "minhas infos"
        case .paymentMethod:
            "formas de pagamento"
        case .myAddress:
            "meus endereços"
        case .configuration:
            "configurações"
        }
    }
}
