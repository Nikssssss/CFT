//
//  Article.swift
//  Task2
//
//  Created by Никита Гусев on 02.03.2021.
//

import Foundation

struct Article: Decodable {
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: URL?
    let urlToImage: URL?
    let publishedAt: String?
    let content: String?
    
    struct Source: Decodable {
        let id: String?
        let name: String?
    }
}

struct ArticleInfo {
    let title: String?
    let description: String?
    let imageUrl: URL?
    let date: String?
}
