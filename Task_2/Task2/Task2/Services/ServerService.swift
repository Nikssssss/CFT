//
//  ServerService.swift
//  Task2
//
//  Created by Никита Гусев on 03.03.2021.
//

import Foundation
import Alamofire

class ServerService {
    func getArticles(completion: @escaping ([ArticleInfo]?) -> Void) {
        self.getJSONArticles { articles in
            guard let currentArticles = articles else {
                completion(nil)
                return
            }
            var articleInfos = [ArticleInfo]()
            for article in currentArticles {
                articleInfos.append(ArticleInfo(title: article.title,
                                                description: article.description,
                                                imageUrl: article.urlToImage,
                                                date: article.publishedAt))
            }
            completion(articleInfos)
        }
    }
    
    private func getJSONArticles(completion: @escaping ([Article]?) -> Void){
        AF.request("https://newsapi.org/v2/top-headlines?country=us&apiKey=a96982fab90e4f1fb320c3980a16c165")
            .cacheResponse(using: ResponseCacher.cache)
            .responseData { response in
            guard let data = response.data else { return }
            let news = try? JSONDecoder().decode(NewsResponse.self, from: data)
            if let currentArticles = news?.articles {
                completion(currentArticles)
            } else {
                completion(nil)
            }
        }
    }
}
