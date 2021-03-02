//
//  NewsConstants.swift
//  Task2
//
//  Created by Никита Гусев on 02.03.2021.
//

import Foundation
import UIKit

struct NewsConstants {
    static let tableViewRowHeight = 320
    
    static let newsCellIdentifier = "NewsTableViewCell"
    static let newsCellInitError = "init(coder:) has not been implemented"
    
    static let newsCellContentViewInsets = UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20)
    static let newsCellContentViewCornerRadius = 10
    static let newsCellContentViewBackgroundColor = UIColor(red: 220.0 / 255.0, green: 220.0 / 255.0, blue: 220.0 / 255.0, alpha: 1.0)
    
    static let newsDateLabelBottomRight = -5
    static let newsDateLabelFontSize = 13
    
    static let newsDescriptionLabelBottom = -50
    static let newsDescriptionLabelRight = -5
    static let newsDescriptionLabelLeft = 5
    static let newsDescriptionLabelLines = 3
    static let newsDesciptionLabelFontSize = 12
    
    static let newsTitleLabelBottom = -10
    static let newsTitleLabelRight = -5
    static let newsTitleLabelLeft = 5
    static let newsTitleLabelFontSize = 30
    
    static let newsImageViewBottom = -10
}
