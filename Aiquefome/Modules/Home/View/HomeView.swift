//
//  HomeView.swift
//  Aiquefome
//
//  Created by André Pimentel on 28/09/24.
//

import Foundation
import UIKit

protocol HomeViewDelegate: AnyObject {
    func closeMenu()
}

class HomeView: UIView {
    var widthConstraint: NSLayoutConstraint?

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(HomeProfileTableViewCell.self, forCellReuseIdentifier: HomeProfileTableViewCell.identifier)
        tableView.register(HomeMenuTableViewCell.self, forCellReuseIdentifier: HomeMenuTableViewCell.identifier)
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        return tableView
    }()
    
    lazy var sideMenuView: UIView = {
        let viewWidth = self.frame.width * 0.88
        let view = UIView()
        view.backgroundColor = .white
        view.frame = CGRect(x: -viewWidth, y: 0, width: viewWidth, height: frame.height)
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(closeMenu), for: .touchUpInside)
        button.setImage(UIImage(named: "arrow-left"), for: .normal)
        return button
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
        let viewWidth = self.frame.width * 0.8
        widthConstraint?.constant = viewWidth
        UIView.animate(withDuration: 0.3) {
            self.sideMenuView.frame.origin.x = 0
            self.layoutIfNeeded()
        }
    }
    
    func closeSideMenu() {
        let viewWidth = self.frame.width * 0.8
        widthConstraint?.constant = -viewWidth
        UIView.animate(withDuration: 0.3) {
            self.sideMenuView.frame.origin.x = -viewWidth
            self.layoutIfNeeded()
        }
    }
}

extension HomeView: CodeView {
    func buildViewHierarchy() {
        addSubview(sideMenuView)
        sideMenuView.addSubview(tableView)
        sideMenuView.addSubview(closeButton)
    }
    
    func setupConstraints() {
        let viewWidth = self.frame.width * 0.8
        widthConstraint = sideMenuView.widthAnchor.constraint(
            equalToConstant: viewWidth
        )
        
        NSLayoutConstraint.activate([
            widthConstraint!,
        ])
        
        sideMenuView.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor
        )
        
        tableView.anchor(
            top: sideMenuView.topAnchor,
            leading: sideMenuView.leadingAnchor,
            trailing: sideMenuView.trailingAnchor
        )
        
        closeButton.anchor(
            top: tableView.bottomAnchor,
            bottom: sideMenuView.bottomAnchor,
            trailing: sideMenuView.trailingAnchor,
            paddingTop: 12,
            paddingBottom: 48,
            paddingRight: 16,
            width: 32,
            height: 32
        )
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
    }
    
    @objc func closeMenu() {
        delegate?.closeMenu()
    }
}

extension HomeView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeProfileTableViewCell.identifier, for: indexPath) as? HomeProfileTableViewCell
            cell?.delegate = self
            return cell ?? UITableViewCell()
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeMenuTableViewCell.identifier, for: indexPath) as? HomeMenuTableViewCell
            let item = MenuViewModel.menuItemFor(index: indexPath.row)
            cell?.configure(item: item)
            return cell ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuViewModel.numbersOfRows()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = MenuViewModel.menuItemFor(index: indexPath.row)
        switch item {
        case .orders:
            closeMenu()
            FlutterInit.shared.route(to: "/order")
        default:
            break
        }
    }
}

extension HomeView: HomeProfileTableViewCellDelegate {
    func routeToCoupon() {
        closeMenu()
        FlutterInit.shared.route(to: "/coupon")
    }
}
