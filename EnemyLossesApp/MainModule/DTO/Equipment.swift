//
//  Equipment.swift
//  EnemyLossesApp
//
//  Created by Nadia on 16.07.2022.
//

import Foundation

struct Equipment: Decodable {
    var date: String
    var day: QuantumValue
    var aircraft: Int?
    var helicopter: Int?
    var tank: Int?
    var apc: Int?
    var fieldArtillery: Int?
    var mrl: Int?
    var militaryAuto: Int?
    var fuelTank: Int?
    var drone: Int?
    var navalShip: Int?
    var antiAircraftWareFare: Int?
    var specialEquipment: Int?
    var mobileSRBMSystem: Int?
    var vehiclesAndFuelTanks: Int?
    var cruiseMissiles: Int?
    
    enum CodingKeys: String, CodingKey {
        case date, day, aircraft, helicopter, tank, drone
        case apc = "APC"
        case fieldArtillery = "field artillery"
        case mrl = "MRL"
        case militaryAuto = "military auto"
        case fuelTank = "fuel tank"
        case navalShip = "naval ship"
        case antiAircraftWareFare = "anti-aircraft warfare"
        case specialEquipment = "special equipment"
        case mobileSRBMSystem = "mobile SRBM system"
        case vehiclesAndFuelTanks = "vehicles and fuel tanks"
        case cruiseMissiles = "cruise missiles"
    }
}

struct QuantumValue: Decodable {
    
    var value: Any?
    
    init(from decoder: Decoder) {
        if let value = try? decoder.singleValueContainer().decode(Int.self) {
            self.value = value
        }
        if let value = try? decoder.singleValueContainer().decode(String.self) {
            self.value = value
        }
    }
}
