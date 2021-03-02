//
//  MainRouter.swift
//  Task2
//
//  Created by Никита Гусев on 02.03.2021.
//

import Foundation

class MainRouter: MainRouterProtocol {
    weak var viewController: MainViewController!
    
    init(viewController: MainViewController){
        self.viewController = viewController
    }
    
    func showNewsScene(){
        self.viewController.navigationController?.pushViewController(NewsViewController(), animated: true)
    }
}
