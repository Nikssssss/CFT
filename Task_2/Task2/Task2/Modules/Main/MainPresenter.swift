//
//  MainPresenter.swift
//  Task2
//
//  Created by Никита Гусев on 02.03.2021.
//

import Foundation

class MainPresenter: MainPresenterProtocol {
    weak var viewController: MainViewControllerProtocol!
    var interactor: MainInteractorProtocol!
    var router: MainRouterProtocol!
    
    init(viewController: MainViewController){
        self.viewController = viewController
    }
    
    func configureView() {
        viewController.configureView(using: interactor.getFamousResources())
    }
    
    func newsButtonClicked(){
        router.showNewsScene()
    }
}
