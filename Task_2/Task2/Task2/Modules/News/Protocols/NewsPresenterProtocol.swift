//
//  NewsPresenterProtocol.swift
//  Task2
//
//  Created by Никита Гусев on 02.03.2021.
//

import Foundation

protocol NewsPresenterProtocol: class {
    func configureView()
    func setViewArticles(using articles: [ArticleInfo]?)
}
