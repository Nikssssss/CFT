//
//  NewsPresenter.swift
//  Task2
//
//  Created by Никита Гусев on 02.03.2021.
//

import Foundation

class NewsPresenter: NewsPresenterProtocol {
    weak var viewController: NewsViewControllerProtocol!
    var interactor: NewsInteractorProtocol!
    
    init(viewController: NewsViewController){
        self.viewController = viewController
    }
    
    func configureView(){
        interactor.downloadArticles()
    }
    
    func setViewArticles(using articles: [ArticleInfo]?){
        viewController.configureView(with: articles)
    }
}
