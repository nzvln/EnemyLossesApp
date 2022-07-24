//
//  OnboardingPresenter.swift
//  EnemyLossesApp
//
//  Created by Nadia on 21.07.2022.
//

import Foundation

protocol MenuViewProtocol: AnyObject {
    func succes()
    func failure(_ error:Error)
}

protocol MenuViewPresenter: AnyObject {
    init (view: MenuViewProtocol)
}


class MenuPresenter: MenuViewPresenter {
    
    weak var view: MenuViewProtocol?
    private let menu: [String] = ["Personnel","Equipment"]
    
    required init(view: MenuViewProtocol) {
        self.view = view
    }
    
    func getMenu() -> [String] {
        return menu
    }
}

