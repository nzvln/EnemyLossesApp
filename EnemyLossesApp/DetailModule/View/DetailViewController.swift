//
//  DetailViewController.swift
//  EnemyLossesApp
//
//  Created by Nadia on 21.07.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    enum ConstraintsOfView {
        static let firstLabelTop: CGFloat = 0
        static let labelTop: CGFloat = 5
        static let centerX: CGFloat = 0
        static let labelHeight: CGFloat = 40
        static let labelWidth: CGFloat = 360
    }
    
    private var presenter: MainPresenter?
    var personnels: Personnel?
    var equipments: Equipment?
    
    //MARK: - Label
    var dayLabel = UILabel.makeLabel()
    var personnelLabel = UILabel.makeLabel()
    var powLabel = UILabel.makeLabel()
    var amountOfAircraftsLabel = UILabel.makeLabel()
    var amountOfHelicoptersLabel = UILabel.makeLabel()
    var amountOfTanksLabel = UILabel.makeLabel()
    var amountOfApcLabel = UILabel.makeLabel()
    var amountOfFieldArtilleryLabel = UILabel.makeLabel()
    var amountOfMrlLabel = UILabel.makeLabel()
    var amountOfMilitaryAutoLabel = UILabel.makeLabel()
    var amountOfFuelTanksLabel = UILabel.makeLabel()
    var amountOfDronesLabel = UILabel.makeLabel()
    var amountOfNavalShipsLabel = UILabel.makeLabel()
    var amountOfAntiAircraftWareFareLabel = UILabel.makeLabel()
    var amountOfSpecialEquipmentLabel = UILabel.makeLabel()
    var amountOfMobileSRBMSystemsLabel = UILabel.makeLabel()
    var amountOfVehiclesAndFuelTanksLabel = UILabel.makeLabel()
    var amountOfCruiseMissilesLabel = UILabel.makeLabel()
    
    override func loadView() {
        super.loadView()
        setUpView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "baseImage")!)
        fetchData()
    }
    
    override func viewWillLayoutSubviews() {
        self.dayLabelPersonnelConstraints()
        self.personnelLabelConstraints()
        self.powLabelConstraints()
        self.amountOfAircraftsLabelConstraints()
        self.amountOfHelicoptersLabelConstraints()
        self.amountOfTanksLabelConstraints()
        self.amountOfApcLabelConstraints()
        self.amountOfFieldArtilleryLabelConstraints()
        self.amountOfMrlLabelConstraints()
        self.amountOfMilitaryAutoLabelConstraints()
        self.amountOfFuelTanksLabelConstraints()
        self.amountOfDronesLabelConstraints()
        self.amountOfNavalShipsLabelConstraints()
        self.amountOfAntiAircraftWareFareLabelConstraints()
        self.amountOfSpecialEquipmentLabelConstraints()
        self.amountOfMobileSRBMSystemsLabelConstraints()
        self.amountOfVehiclesAndFuelTanksLabelConstraints()
        self.amountOfCruiseMissilesLabelConstraints()
    }
    
    func setUpView() {
        view.addSubview(dayLabel)
        view.addSubview(personnelLabel)
        view.addSubview(powLabel)
        view.addSubview(amountOfAircraftsLabel)
        view.addSubview(amountOfHelicoptersLabel)
        view.addSubview(amountOfTanksLabel)
        view.addSubview(amountOfApcLabel)
        view.addSubview(amountOfFieldArtilleryLabel)
        view.addSubview(amountOfMrlLabel)
        view.addSubview(amountOfMilitaryAutoLabel)
        view.addSubview(amountOfFuelTanksLabel)
        view.addSubview(amountOfDronesLabel)
        view.addSubview(amountOfNavalShipsLabel)
        view.addSubview(amountOfAntiAircraftWareFareLabel)
        view.addSubview(amountOfSpecialEquipmentLabel)
        view.addSubview(amountOfMobileSRBMSystemsLabel)
        view.addSubview(amountOfVehiclesAndFuelTanksLabel)
        view.addSubview(amountOfCruiseMissilesLabel)
    }
    
    func fetchData() {
        switch state {
        case .personnel:
            guard let personnels = personnels else {
                return
            }
            dayLabel.text = "Day: \(personnels.day)"
            personnelLabel.text = "Personnel: \(personnels.personnel)"
            powLabel.text = "Pow: \(personnels.pow ?? 0)"
            amountOfAircraftsLabel.isHidden = true
            amountOfHelicoptersLabel.isHidden = true
            amountOfTanksLabel.isHidden = true
            amountOfApcLabel.isHidden = true
            amountOfFieldArtilleryLabel.isHidden = true
            amountOfMrlLabel.isHidden = true
            amountOfMilitaryAutoLabel.isHidden = true
            amountOfFuelTanksLabel.isHidden = true
            amountOfDronesLabel.isHidden = true
            amountOfNavalShipsLabel.isHidden = true
            amountOfAntiAircraftWareFareLabel.isHidden = true
            amountOfSpecialEquipmentLabel.isHidden = true
            amountOfMobileSRBMSystemsLabel.isHidden = true
            amountOfVehiclesAndFuelTanksLabel.isHidden = true
            amountOfCruiseMissilesLabel.isHidden = true
        case .equipment:
            guard let equipments = equipments else {
                return
            }
            dayLabel.text = "Day: \(String(describing: equipments.day.value ?? 0))"
            amountOfAircraftsLabel.text = "Aircrafts: \(equipments.aircraft ?? 0)"
            amountOfHelicoptersLabel.text = "Helicopters: \(equipments.helicopter ?? 0)"
            amountOfTanksLabel.text = "Tanks: \(equipments.tank ?? 0)"
            amountOfApcLabel.text = "APC: \(equipments.apc ?? 0)"
            amountOfFieldArtilleryLabel.text = "Field Artillery: \(equipments.fieldArtillery ?? 0)"
            amountOfMrlLabel.text = "MRL: \(equipments.mrl ?? 0)"
            amountOfMilitaryAutoLabel.text = "Military Auto: \(equipments.militaryAuto ?? 0)"
            amountOfFuelTanksLabel.text = "Fuel Tanks: \(equipments.fuelTank ?? 0)"
            amountOfDronesLabel.text = "Drones: \(equipments.drone ?? 0)"
            amountOfNavalShipsLabel.text = "Naval Ships: \(equipments.navalShip ?? 0)"
            amountOfAntiAircraftWareFareLabel.text = "AntiAircraft WareFare: \(equipments.antiAircraftWareFare ?? 0)"
            amountOfSpecialEquipmentLabel.text = "Special Equipment: \(equipments.specialEquipment ?? 0)"
            amountOfMobileSRBMSystemsLabel.text = "Mobile SRBM Systems: \(equipments.mobileSRBMSystem ?? 0)"
            amountOfVehiclesAndFuelTanksLabel.text = "Vehicles And FuelTanks: \(equipments.vehiclesAndFuelTanks ?? 0)"
            amountOfCruiseMissilesLabel.text = "Cruise Missiles: \(equipments.cruiseMissiles ?? 0)"
            
        default:
            break
        }
    }
    
    //MARK: - Constraints
    
    func dayLabelPersonnelConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: dayLabel, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: ConstraintsOfView.firstLabelTop),
            NSLayoutConstraint(item: dayLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: ConstraintsOfView.centerX),
            NSLayoutConstraint(item: dayLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfView.labelHeight),
            NSLayoutConstraint(item: dayLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfView.labelWidth)])
    }
    
    func personnelLabelConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: personnelLabel, attribute: .top, relatedBy: .equal, toItem: dayLabel, attribute: .bottom, multiplier: 1, constant: ConstraintsOfView.labelTop),
            NSLayoutConstraint(item: personnelLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: ConstraintsOfView.centerX),
            NSLayoutConstraint(item: personnelLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfView.labelHeight),
            NSLayoutConstraint(item: personnelLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfView.labelWidth)])
    }
    
    func powLabelConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: powLabel, attribute: .top, relatedBy: .equal, toItem: personnelLabel, attribute: .bottom, multiplier: 1, constant: ConstraintsOfView.labelTop),
            NSLayoutConstraint(item: powLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: ConstraintsOfView.centerX),
            NSLayoutConstraint(item: powLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfView.labelHeight),
            NSLayoutConstraint(item: powLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfView.labelWidth)])
    }
    
    func amountOfAircraftsLabelConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: amountOfAircraftsLabel, attribute: .top, relatedBy: .equal, toItem: dayLabel, attribute: .bottom, multiplier: 1, constant: ConstraintsOfView.labelTop),
            NSLayoutConstraint(item: amountOfAircraftsLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: ConstraintsOfView.centerX),
            NSLayoutConstraint(item: amountOfAircraftsLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfView.labelHeight),
            NSLayoutConstraint(item: amountOfAircraftsLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfView.labelWidth)])
    }
    
    func amountOfHelicoptersLabelConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: amountOfHelicoptersLabel, attribute: .top, relatedBy: .equal, toItem: amountOfAircraftsLabel, attribute: .bottom, multiplier: 1, constant: ConstraintsOfView.labelTop),
            NSLayoutConstraint(item: amountOfHelicoptersLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: ConstraintsOfView.centerX),
            NSLayoutConstraint(item: amountOfHelicoptersLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfView.labelHeight),
            NSLayoutConstraint(item: amountOfHelicoptersLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfView.labelWidth)])
    }
    
    func amountOfTanksLabelConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: amountOfTanksLabel, attribute: .top, relatedBy: .equal, toItem: amountOfHelicoptersLabel, attribute: .bottom, multiplier: 1, constant: ConstraintsOfView.labelTop),
            NSLayoutConstraint(item: amountOfTanksLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: ConstraintsOfView.centerX),
            NSLayoutConstraint(item: amountOfTanksLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfView.labelHeight),
            NSLayoutConstraint(item: amountOfTanksLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfView.labelWidth)])
    }
    
    func amountOfApcLabelConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: amountOfApcLabel, attribute: .top, relatedBy: .equal, toItem: amountOfTanksLabel, attribute: .bottom, multiplier: 1, constant: ConstraintsOfView.labelTop),
            NSLayoutConstraint(item: amountOfApcLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: ConstraintsOfView.centerX),
            NSLayoutConstraint(item: amountOfApcLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfView.labelHeight),
            NSLayoutConstraint(item: amountOfApcLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfView.labelWidth)])
    }
    
    func amountOfFieldArtilleryLabelConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: amountOfFieldArtilleryLabel, attribute: .top, relatedBy: .equal, toItem: amountOfApcLabel, attribute: .bottom, multiplier: 1, constant: ConstraintsOfView.labelTop),
            NSLayoutConstraint(item: amountOfFieldArtilleryLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: ConstraintsOfView.centerX),
            NSLayoutConstraint(item: amountOfFieldArtilleryLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfView.labelHeight),
            NSLayoutConstraint(item: amountOfFieldArtilleryLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfView.labelWidth)])
    }
    
    func amountOfMrlLabelConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: amountOfMrlLabel, attribute: .top, relatedBy: .equal, toItem: amountOfFieldArtilleryLabel, attribute: .bottom, multiplier: 1, constant: ConstraintsOfView.labelTop),
            NSLayoutConstraint(item: amountOfMrlLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: ConstraintsOfView.centerX),
            NSLayoutConstraint(item: amountOfMrlLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfView.labelHeight),
            NSLayoutConstraint(item: amountOfMrlLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfView.labelWidth)])
    }
    
    func amountOfMilitaryAutoLabelConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: amountOfMilitaryAutoLabel, attribute: .top, relatedBy: .equal, toItem: amountOfMrlLabel, attribute: .bottom, multiplier: 1, constant: ConstraintsOfView.labelTop),
            NSLayoutConstraint(item: amountOfMilitaryAutoLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: ConstraintsOfView.centerX),
            NSLayoutConstraint(item: amountOfMilitaryAutoLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfView.labelHeight),
            NSLayoutConstraint(item: amountOfMilitaryAutoLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfView.labelWidth)])
    }
    
    func amountOfFuelTanksLabelConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: amountOfFuelTanksLabel, attribute: .top, relatedBy: .equal, toItem: amountOfMilitaryAutoLabel, attribute: .bottom, multiplier: 1, constant: ConstraintsOfView.labelTop),
            NSLayoutConstraint(item: amountOfFuelTanksLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: ConstraintsOfView.centerX),
            NSLayoutConstraint(item: amountOfFuelTanksLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfView.labelHeight),
            NSLayoutConstraint(item: amountOfFuelTanksLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfView.labelWidth)])
    }
    
    func amountOfDronesLabelConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: amountOfDronesLabel, attribute: .top, relatedBy: .equal, toItem: amountOfFuelTanksLabel, attribute: .bottom, multiplier: 1, constant: ConstraintsOfView.labelTop),
            NSLayoutConstraint(item: amountOfDronesLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: ConstraintsOfView.centerX),
            NSLayoutConstraint(item: amountOfDronesLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfView.labelHeight),
            NSLayoutConstraint(item: amountOfDronesLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfView.labelWidth)])
    }
    
    func amountOfNavalShipsLabelConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: amountOfNavalShipsLabel, attribute: .top, relatedBy: .equal, toItem: amountOfDronesLabel, attribute: .bottom, multiplier: 1, constant: ConstraintsOfView.labelTop),
            NSLayoutConstraint(item: amountOfNavalShipsLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: ConstraintsOfView.centerX),
            NSLayoutConstraint(item: amountOfNavalShipsLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfView.labelHeight),
            NSLayoutConstraint(item: amountOfNavalShipsLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfView.labelWidth)])
    }
    
    func amountOfAntiAircraftWareFareLabelConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: amountOfAntiAircraftWareFareLabel, attribute: .top, relatedBy: .equal, toItem: amountOfNavalShipsLabel, attribute: .bottom, multiplier: 1, constant: ConstraintsOfView.labelTop),
            NSLayoutConstraint(item: amountOfAntiAircraftWareFareLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: ConstraintsOfView.centerX),
            NSLayoutConstraint(item: amountOfAntiAircraftWareFareLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfView.labelHeight),
            NSLayoutConstraint(item: amountOfAntiAircraftWareFareLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfView.labelWidth)])
    }
    
    func amountOfSpecialEquipmentLabelConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: amountOfSpecialEquipmentLabel, attribute: .top, relatedBy: .equal, toItem: amountOfAntiAircraftWareFareLabel, attribute: .bottom, multiplier: 1, constant: ConstraintsOfView.labelTop),
            NSLayoutConstraint(item: amountOfSpecialEquipmentLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: ConstraintsOfView.centerX),
            NSLayoutConstraint(item: amountOfSpecialEquipmentLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfView.labelHeight),
            NSLayoutConstraint(item: amountOfSpecialEquipmentLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfView.labelWidth)])
    }
    
    func amountOfMobileSRBMSystemsLabelConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: amountOfMobileSRBMSystemsLabel, attribute: .top, relatedBy: .equal, toItem: amountOfSpecialEquipmentLabel, attribute: .bottom, multiplier: 1, constant: ConstraintsOfView.labelTop),
            NSLayoutConstraint(item: amountOfMobileSRBMSystemsLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: ConstraintsOfView.centerX),
            NSLayoutConstraint(item: amountOfMobileSRBMSystemsLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfView.labelHeight),
            NSLayoutConstraint(item: amountOfMobileSRBMSystemsLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfView.labelWidth)])
    }
    
    func amountOfVehiclesAndFuelTanksLabelConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: amountOfVehiclesAndFuelTanksLabel, attribute: .top, relatedBy: .equal, toItem: amountOfMobileSRBMSystemsLabel, attribute: .bottom, multiplier: 1, constant: ConstraintsOfView.labelTop),
            NSLayoutConstraint(item: amountOfVehiclesAndFuelTanksLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: ConstraintsOfView.centerX),
            NSLayoutConstraint(item: amountOfVehiclesAndFuelTanksLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfView.labelHeight),
            NSLayoutConstraint(item: amountOfVehiclesAndFuelTanksLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfView.labelWidth)])
    }
    
    func amountOfCruiseMissilesLabelConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: amountOfCruiseMissilesLabel, attribute: .top, relatedBy: .equal, toItem: amountOfVehiclesAndFuelTanksLabel, attribute: .bottom, multiplier: 1, constant: ConstraintsOfView.labelTop),
            NSLayoutConstraint(item: amountOfCruiseMissilesLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: ConstraintsOfView.centerX),
            NSLayoutConstraint(item: amountOfCruiseMissilesLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfView.labelHeight),
            NSLayoutConstraint(item: amountOfCruiseMissilesLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfView.labelWidth)])
    }
}


extension UILabel {
    
    static func makeLabel() -> UILabel {
        let label = UILabel()
        label.textColor = UIColor.black
        label.backgroundColor = UIColor(named: "haki")
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byCharWrapping
        label.sizeToFit()
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        label.textAlignment = .left
        
        return label
    }
}
