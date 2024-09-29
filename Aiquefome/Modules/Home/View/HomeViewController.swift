//
//  HomeViewController.swift
//  Aiquefome
//
//  Created by André Pimentel on 28/09/24.
//

import Foundation
import UIKit

final class HomeViewController: UIViewController {
    private var homeView = HomeView()
    private var interactor: HomeInteractor
    private var router: HomeRouter
    
    init(interactor: HomeInteractor, router: HomeRouter) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view = homeView
        homeView.delegate = self
        setupNavigationBarItems()
    }
    
    func setupNavigationBarItems() {
        let icon1 = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(icon1Tapped))
        
        let icon2 = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(icon2Tapped))
        
        let icon3 = UIBarButtonItem(image: UIImage(systemName: "person"), style: .plain, target: self, action: #selector(icon3Tapped))
        
        navigationItem.rightBarButtonItems = [icon3, icon2]
        navigationItem.leftBarButtonItem = icon1
    }
    
    @objc func icon2Tapped() {
        print("Ícone 2 tocado")
    }
    
    @objc func icon3Tapped() {
        print("Ícone 3 tocado")
    }
    
    @objc func icon1Tapped() {
        homeView.icon1Tapped()
    }
}

extension HomeViewController: HomeViewDelegate {
    func openFutterModule() {
        let flutterModule = FlutterInit.shared.flutterModule
        navigationController?.pushViewController(flutterModule, animated: true)
    }
}

extension HomeViewController: HomeDisplayLogic {
    func display(viewModel: HomeViewModel) {
    }
}

