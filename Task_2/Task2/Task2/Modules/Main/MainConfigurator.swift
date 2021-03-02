//
//  MainConfigurator.swift
//  Task2
//
//  Created by Никита Гусев on 02.03.2021.
//

import Foundation

class MainConfigurator: MainConfiguratorProtocol {
    func configure(with viewController: MainViewController){
        let presenter = MainPresenter(viewController: viewController)
        let interactor = MainInteractor(presenter: presenter)
        let router = MainRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
