//
//  NewsViewControllerProtocol.swift
//  Task2
//
//  Created by Никита Гусев on 02.03.2021.
//

import Foundation

protocol NewsViewControllerProtocol: class {
    func configureView(with articles: [ArticleInfo]?)
}
