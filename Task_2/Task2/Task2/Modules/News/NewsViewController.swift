//
//  NewsViewController.swift
//  Task2
//
//  Created by Никита Гусев on 02.03.2021.
//

import UIKit
import SDWebImage

class NewsViewController: UIViewController {
    private var newsTableView: UITableView!
    
    let configurator: NewsConfiguratorProtocol = NewsConfigurator()
    var presenter: NewsPresenterProtocol!
    
    var articles: [ArticleInfo]?

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()        
    }

}

extension NewsViewController: NewsViewControllerProtocol {
    func configureView(with articles: [ArticleInfo]?){
        self.setupTableView()
        self.articles = articles
        self.title = NewsConstants.viewControllerTitle
        self.newsTableView.register(NewsTableViewCell.self,
                                    forCellReuseIdentifier: NewsConstants.newsCellIdentifier)
        self.newsTableView.dataSource = self
    }
}

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let currentArticles = articles {
            return currentArticles.count
        } else { return 0 }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsConstants.newsCellIdentifier) as! NewsTableViewCell
        guard let currentArticles = articles else { return cell }
        cell.newsDateLabel.text = currentArticles[indexPath.row].date
        cell.newsDescriptionLabel.text = currentArticles[indexPath.row].description
        cell.newsTitleLabel.text = currentArticles[indexPath.row].title
        cell.newsImageView.sd_setImage(with: currentArticles[indexPath.row].imageUrl)
        return cell
    }
    
}

private extension NewsViewController {
    func setupTableView(){
        self.newsTableView = UITableView()
        self.view.addSubview(newsTableView)
        self.newsTableView.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalToSuperview()
        }
        self.newsTableView.rowHeight = CGFloat(NewsConstants.tableViewRowHeight)
        self.newsTableView.separatorStyle = .none
    }
}
