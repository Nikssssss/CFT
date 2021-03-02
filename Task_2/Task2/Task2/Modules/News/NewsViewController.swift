//
//  NewsViewController.swift
//  Task2
//
//  Created by Никита Гусев on 02.03.2021.
//

import UIKit

class NewsViewController: UIViewController {
    private var newsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.newsTableView.register(NewsTableViewCell.self,
                                    forCellReuseIdentifier: NewsConstants.newsCellIdentifier)
        self.newsTableView.dataSource = self
    }

}

extension NewsViewController: NewsViewControllerProtocol {
    
}

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsConstants.newsCellIdentifier) as! NewsTableViewCell
        cell.newsDateLabel.text = "Aaaaaaaaaa"
        cell.newsDescriptionLabel.text = "Bbbbbbbbb"
        cell.newsTitleLabel.text = "akjfosajnfsd"
        
        return cell
    }
    
}

private extension NewsViewController {
    func setupView(){
        self.newsTableView = UITableView()
        self.view.addSubview(newsTableView)
        self.newsTableView.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalToSuperview()
        }
        self.newsTableView.rowHeight = CGFloat(NewsConstants.tableViewRowHeight)
        self.newsTableView.separatorStyle = .none
    }
}
