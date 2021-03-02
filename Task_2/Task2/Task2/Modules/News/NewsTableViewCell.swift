//
//  NewsTableViewCell.swift
//  Task2
//
//  Created by Никита Гусев on 02.03.2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    let newsImageView = UIImageView()
    let newsTitleLabel = UILabel()
    let newsDescriptionLabel = UILabel()
    let newsDateLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViewCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError(NewsConstants.newsCellInitError)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: NewsConstants.newsCellContentViewInsets)
        contentView.layer.cornerRadius = CGFloat(NewsConstants.newsCellContentViewCornerRadius)
    }
}

private extension NewsTableViewCell {
    func setupViewCell(){
        self.contentView.backgroundColor = NewsConstants.newsCellContentViewBackgroundColor
        self.setupDateLabel()
        self.setupDescriptionLabel()
        self.setupTitleLabel()
        self.setupImageView()
    }
    
    func setupDateLabel(){
        self.contentView.addSubview(self.newsDateLabel)
        self.newsDateLabel.snp.makeConstraints{ (make) in
            make.bottom.right.equalTo(self.contentView).offset(NewsConstants.newsDateLabelBottomRight)
        }
        self.newsDateLabel.font = .systemFont(ofSize: CGFloat(NewsConstants.newsDateLabelFontSize))
    }
    
    func setupDescriptionLabel(){
        self.contentView.addSubview(self.newsDescriptionLabel)
        self.newsDescriptionLabel.snp.makeConstraints{ (make) in
            make.bottom.equalTo(self.newsDateLabel.snp.top).offset(NewsConstants.newsDescriptionLabelBottom)
            make.right.equalTo(self.contentView).offset(NewsConstants.newsDescriptionLabelRight)
            make.left.equalTo(self.contentView).offset(NewsConstants.newsDescriptionLabelLeft)
        }
        self.newsDescriptionLabel.numberOfLines = NewsConstants.newsDescriptionLabelLines
        self.newsDescriptionLabel.font = .systemFont(ofSize: CGFloat(NewsConstants.newsDesciptionLabelFontSize))
    }
    
    func setupTitleLabel(){
        self.contentView.addSubview(self.newsTitleLabel)
        self.newsTitleLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.newsDescriptionLabel.snp.top).offset(NewsConstants.newsTitleLabelBottom)
            make.right.equalTo(self.contentView).offset(NewsConstants.newsTitleLabelRight)
            make.left.equalTo(self.contentView).offset(NewsConstants.newsTitleLabelLeft)
        }
        self.newsTitleLabel.font = .systemFont(ofSize: CGFloat(NewsConstants.newsTitleLabelFontSize))
        self.newsTitleLabel.textAlignment = .center
    }
    
    func setupImageView(){
        self.contentView.addSubview(self.newsImageView)
        self.newsImageView.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.newsTitleLabel.snp.top).offset(NewsConstants.newsImageViewBottom)
            make.right.left.top.equalTo(self.contentView)
        }
        self.newsImageView.contentMode = .scaleToFill
    }
}
