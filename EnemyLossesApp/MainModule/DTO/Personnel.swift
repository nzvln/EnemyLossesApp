//
//  Personnel.swift
//  EnemyLossesApp
//
//  Created by Nadia on 16.07.2022.
//

import Foundation

struct Personnel: Codable {
    var date: String
    var day: Int
    var personnel: Int
    
    enum CodingKeys: String, CodingKey {
        case date, day, personnel
    }
}
