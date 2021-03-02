//
//  NewsInteractor.swift
//  Task2
//
//  Created by Никита Гусев on 02.03.2021.
//

import Foundation

class NewsInteractor: NewsInteractorProtocol {
    weak var presenter: NewsPresenterProtocol!
    let serverService = ServerService()
    
    init(presenter: NewsPresenter){
        self.presenter = presenter
    }
    
    func downloadArticles() {
        serverService.getArticles() { [weak self] articles in
            self?.presenter.setViewArticles(using: articles)
        }
    }
}
