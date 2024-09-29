//
//  HomeView.swift
//  Aiquefome
//
//  Created by André Pimentel on 28/09/24.
//

import Foundation
import UIKit

protocol HomeViewDelegate: AnyObject {
    func openCouponsFutterModule()
    func openOrdersFutterModule()
}

class HomeView: UIView {
    var widthConstraint: NSLayoutConstraint?

    lazy var sideMenuView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.frame = CGRect(x: -250, y: 0, width: 250, height: frame.height)
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    lazy var couponMenuButton: UIButton = {
        let menuButton = UIButton(frame: CGRect(x: 50, y: 100, width: 150, height: 50))
        menuButton.setTitle("Cupons", for: .normal)
        menuButton.setTitleColor(.black, for: .normal)
        menuButton.backgroundColor = .lightGray
        menuButton.addTarget(self, action: #selector(openCouponsFlutterModule), for: .touchUpInside)
        return menuButton
    }()
    
    lazy var ordersMenuButton: UIButton = {
        let menuButton = UIButton(frame: CGRect(x: 50, y: 100, width: 150, height: 50))
        menuButton.setTitle("Meus Pedidos", for: .normal)
        menuButton.setTitleColor(.black, for: .normal)
        menuButton.backgroundColor = .lightGray
        menuButton.addTarget(self, action: #selector(openOrdersFlutterModule), for: .touchUpInside)
        return menuButton
    }()
    
    var delegate: HomeViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func icon1Tapped() {
        if sideMenuView.frame.origin.x == 0 {
            closeSideMenu()
        } else {
            openSideMenu()
        }
    }
    
    func openSideMenu() {
        widthConstraint?.constant = 250
        UIView.animate(withDuration: 0.3) {
            self.sideMenuView.frame.origin.x = 0
            self.layoutIfNeeded()
        }
    }
    
    func closeSideMenu() {
        widthConstraint?.constant = -250
        UIView.animate(withDuration: 0.3) {
            self.sideMenuView.frame.origin.x = -250
            self.layoutIfNeeded()
        }
    }
    
    @objc func openCouponsFlutterModule() {
        closeSideMenu()
        delegate?.openCouponsFutterModule()
    }
    
    @objc func openOrdersFlutterModule() {
        closeSideMenu()
        delegate?.openOrdersFutterModule()
    }
}

extension HomeView: CodeView {
    func buildViewHierarchy() {
        addSubview(sideMenuView)
        sideMenuView.addSubview(couponMenuButton)
        sideMenuView.addSubview(ordersMenuButton)
    }
    
    func setupConstraints() {
        widthConstraint = sideMenuView.widthAnchor.constraint(equalToConstant: 0)

        NSLayoutConstraint.activate([
            widthConstraint!,
        ])
        
        sideMenuView.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor
        )
        
        couponMenuButton.anchor(
            top: sideMenuView.topAnchor,
            leading: sideMenuView.leadingAnchor,
            trailing: sideMenuView.trailingAnchor,
            paddingTop: 100
        )
        
        ordersMenuButton.anchor(
            top: couponMenuButton.bottomAnchor,
            leading: sideMenuView.leadingAnchor,
            trailing: sideMenuView.trailingAnchor,
            paddingTop: 18
        )
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
    }
}
