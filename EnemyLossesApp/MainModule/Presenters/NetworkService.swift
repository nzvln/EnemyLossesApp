//
//  NetworkManager.swift
//  EnemyLossesApp
//
//  Created by Nadia on 16.07.2022.
//

import Foundation

struct UrlOfData {
    typealias RawValue = String
    static let urlPersonnel = "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_personnel.json"
    static let urlEquipment = "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_equipment.json"
}


final class NetworkService {
    
    func getPersonnel(_ completion: @escaping (Result<[Personnel]?, Error>) -> Void) {
        
        guard let url = URL(string: UrlOfData.urlPersonnel) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            do {
                let obj = try JSONDecoder().decode([Personnel].self, from: data!)
                completion(.success(obj))
            } catch{
                completion(.failure(error))
            }
            
        }.resume()
    }
    
    func getEquipment(_ completion: @escaping (Result<[Equipment]?, Error>) -> Void) {
        
        guard let url = URL(string: UrlOfData.urlEquipment) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            if let error = error {
                completion(.failure(error))
            }
            do {
                let obj = try JSONDecoder().decode([Equipment].self, from: data!)
                completion(.success(obj))
            } catch{
                completion(.failure(error))
            }
            
        }.resume()
    }
}


