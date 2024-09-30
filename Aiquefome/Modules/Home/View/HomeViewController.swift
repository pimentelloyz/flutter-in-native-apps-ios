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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
}

extension HomeViewController: HomeDisplayLogic {
    func display(viewModel: HomeViewModel) {
    }
}

