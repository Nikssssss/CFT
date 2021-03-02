//
//  NewsConfigurator.swift
//  Task2
//
//  Created by Никита Гусев on 02.03.2021.
//

import Foundation

class NewsConfigurator: NewsConfiguratorProtocol {
    func configure(with viewController: NewsViewController){
        let presenter = NewsPresenter(viewController: viewController)
        let interactor = NewsInteractor(presenter: presenter)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
    }
}
