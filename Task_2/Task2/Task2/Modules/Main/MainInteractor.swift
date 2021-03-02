//
//  MainInteractor.swift
//  Task2
//
//  Created by Никита Гусев on 02.03.2021.
//

import Foundation

class MainInteractor: MainInteractorProtocol {
    weak var presenter: MainPresenterProtocol!
    let storageService: StorageService = StorageService()
    
    init(presenter: MainPresenter){
        self.presenter = presenter
    }
    
    func getFamousResources() -> [String]{
        return storageService.famousNewsResources
    }
}
