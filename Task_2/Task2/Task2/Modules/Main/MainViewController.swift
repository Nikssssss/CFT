//
//  MainViewController.swift
//  Task2
//
//  Created by Никита Гусев on 02.03.2021.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    private var newsButton: UIButton!
    private var contentView: UIView!
    private var titleLabel: UILabel!
    private var descriptionLabel: UILabel!
    private var sourcesStackView: UIStackView!
    
    let configurator: MainConfiguratorProtocol = MainConfigurator()
    var presenter: MainPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
    }
}

extension MainViewController: MainViewControllerProtocol {
    func configureView(using sources: [String]){
        self.view.backgroundColor = .white
        self.title = MainConstants.viewControllerTitle
        self.setupNewsButton()
        self.setupBackgroundScrollView()
        self.setupLabels()
        self.setupSourcesStackView()
        self.setSourcesViews(using: sources)
    }
}

private extension MainViewController {
    func setupNewsButton(){
        self.newsButton = UIButton()
        self.view.addSubview(newsButton)
        self.newsButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(MainConstants.newsButtonBottom)
            make.centerX.equalToSuperview()
            make.width.equalTo(MainConstants.newsButtonWidth)
            make.height.equalTo(MainConstants.newsButtonHeight)
        }
        self.newsButton.setTitle(MainConstants.newsButtonTitle, for: .normal)
        self.newsButton.setTitleColor(.darkGray, for: .normal)
        self.newsButton.titleLabel?.font = UIFont(name: MainConstants.newsButtonFont, size: CGFloat(MainConstants.newsButtonFontSize))
        self.newsButton.layer.borderWidth = CGFloat(MainConstants.newsButtonBorderWidth)
        self.newsButton.layer.borderColor = UIColor.gray.cgColor
        self.newsButton.layer.cornerRadius = CGFloat(MainConstants.newsButtonCornerRadius)
        self.newsButton.addTarget(self, action: #selector(self.newsButtonClicked), for: .touchUpInside)
    }
    
    func setupBackgroundScrollView(){
        let scrollView = UIScrollView()
        self.view.addSubview(scrollView)
        scrollView.contentInsetAdjustmentBehavior = .always
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(self.newsButton.snp.top)
        }
        
        self.contentView = UIView()
        scrollView.addSubview(self.contentView)
        self.contentView.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.width.equalTo(self.view)
        }
    }
    
    func setupLabels(){
        self.titleLabel = UILabel()
        self.contentView.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(MainConstants.titleLabelTop)
            make.centerX.equalToSuperview()
        }
        self.titleLabel.text = MainConstants.titleLabelText
        self.titleLabel.font = UIFont(name: MainConstants.titleLabelFont, size: CGFloat(MainConstants.titleLabelFontSize))
        self.titleLabel.textColor = .black
        
        self.descriptionLabel = UILabel()
        self.contentView.addSubview(self.descriptionLabel)
        self.descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(MainConstants.descriptionLabelTop)
            make.centerX.equalToSuperview()
        }
        self.descriptionLabel.text = MainConstants.descriptionLabelText
        self.descriptionLabel.font = UIFont(name: MainConstants.descriptionLabelFont, size: CGFloat(MainConstants.descriptionLabelFontSize))
        self.descriptionLabel.textColor = .darkGray
    }
    
    func setupSourcesStackView(){
        self.sourcesStackView = UIStackView()
        self.sourcesStackView.alignment = .center
        self.sourcesStackView.spacing = CGFloat(MainConstants.sourcesStackViewSpacing)
        self.sourcesStackView.distribution = .equalSpacing
        self.sourcesStackView.axis = .vertical
        self.sourcesStackView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(sourcesStackView)
        self.sourcesStackView.snp.makeConstraints { (make) in
            make.top.equalTo(self.descriptionLabel.snp.bottom).offset(MainConstants.sourcesStackViewTop)
            make.right.left.bottom.equalTo(self.contentView)
            make.width.equalTo(self.contentView)
        }
    }
    
    func setSourcesViews(using sources: [String]){
        for source in sources {
            let sourceView = UIView()
            sourceView.snp.makeConstraints { (make) in
                make.width.height.equalTo(MainConstants.sourceViewWidthHeight)
            }
            sourceView.backgroundColor = MainConstants.sourceViewBackgroundColor
            sourceView.layer.cornerRadius = CGFloat(MainConstants.sourceViewCornnerRadius)
            
            let sourceTitleLabel = UILabel()
            sourceView.addSubview(sourceTitleLabel)
            sourceTitleLabel.snp.makeConstraints { (make) in
                make.centerX.centerY.equalToSuperview()
                make.width.equalToSuperview().inset(MainConstants.sourceTitleLabelWidth)
                make.height.equalTo(MainConstants.sourceTitleLabelHeight)
            }
            sourceTitleLabel.text = source
            sourceTitleLabel.adjustsFontSizeToFitWidth = true
            sourceTitleLabel.font = UIFont(name: MainConstants.sourceTitleLabelFont, size: CGFloat(MainConstants.sourceTitleLabelFontSize))
            sourceTitleLabel.textColor = .black
            sourceTitleLabel.backgroundColor = .white
            sourceTitleLabel.textAlignment = .center
            
            self.sourcesStackView.addArrangedSubview(sourceView)
        }
    }
    
    
    @objc func newsButtonClicked() {
        presenter.newsButtonClicked()
    }
}
