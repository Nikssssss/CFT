//
//  NewsResponse.swift
//  Task2
//
//  Created by Никита Гусев on 02.03.2021.
//

import Foundation

struct NewsResponse: Decodable {
    let status: String?
    let totalResult: Int?
    let articles: [Article]?
}
