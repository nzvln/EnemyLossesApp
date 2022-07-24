//
//  MainPresenter.swift
//  EnemyLossesApp
//
//  Created by Nadia on 20.07.2022.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    func succes()
    func failure(error: Error)
}

class MainPresenter {
    weak var view: MainViewProtocol?
    private let networkService: NetworkService
    private var personnels: [Personnel] = [Personnel]()
    private var equipments: [Equipment] = [Equipment]()
    
    required init(view: MainViewProtocol) {
        self.view = view
        self.networkService = NetworkService()
    }
    
    func personnelData() -> [Personnel] {
        return personnels
    }
    
    func equipmentData() -> [Equipment] {
        return equipments
    }
    
    func getPersonnel() {
        networkService.getPersonnel() { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let personnels):
                    guard let personnel = personnels else {
                        print("personnel data is `nil`")
                        return
                    }
                    self.personnels = personnel
                    self.view?.succes()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    func getEquipment() {
        networkService.getEquipment() { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let equipment):
                    guard let equipment = equipment else {
                        print("personnel data is `nil`")
                        return
                    }
                    self.equipments = equipment
                    self.view?.succes()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
}


