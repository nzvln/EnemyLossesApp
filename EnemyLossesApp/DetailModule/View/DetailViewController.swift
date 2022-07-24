//
//  DetailViewController.swift
//  EnemyLossesApp
//
//  Created by Nadia on 21.07.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var personnels: Personnel?
    var equipments: Equipment?
    
    //MARK: - Label
    var dateLabelPersonnel = UILabel.makeLabel()
    var dayLabelPersonnel = UILabel.makeLabel()
    var personnelLabel = UILabel.makeLabel()
    var powLabel = UILabel.makeLabel()
    var dateLabelEquipment = UILabel.makeLabel()
    var dayLabelEquipment = UILabel.makeLabel()
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
    
    convenience init(personnel: Personnel) {
        self.init()
    }
    
    convenience init(equipment: Equipment) {
        self.init()
    }
    
    override func loadView() {
        super.loadView()
        view.addSubview(dateLabelPersonnel)
        view.addSubview(dayLabelPersonnel)
        view.addSubview(personnelLabel)
        view.addSubview(powLabel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "baseImage")!)
        setPersonnels()
        setEquipment()
    }
    
    override func viewWillLayoutSubviews() {
        self.dateLabelPersonnelConstraints()
        self.dayLabelPersonnelConstraints()
        self.personnelLabelConstraints()
        self.powLabelConstraints()
    }
    
    func setEquipment() {
        print("Equipment")
    }
    
    func setPersonnels() {
        dateLabelPersonnel.text = "Date: "
        dayLabelPersonnel.text = "Day: "
        personnelLabel.text = "Personnel: "
        powLabel.text = "Pow: "
    }
    
    //MARK: - Constraints
    func dateLabelPersonnelConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: dateLabelPersonnel, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 50),
            NSLayoutConstraint(item: dateLabelPersonnel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: dateLabelPersonnel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 80),
            NSLayoutConstraint(item: dateLabelPersonnel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 360)])
    }
    
    func dayLabelPersonnelConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: dayLabelPersonnel, attribute: .top, relatedBy: .equal, toItem: dateLabelPersonnel, attribute: .bottom, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: dayLabelPersonnel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: dayLabelPersonnel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 80),
            NSLayoutConstraint(item: dayLabelPersonnel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 360)])
    }
    
    func personnelLabelConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: personnelLabel, attribute: .top, relatedBy: .equal, toItem: dayLabelPersonnel, attribute: .bottom, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: personnelLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: personnelLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 80),
            NSLayoutConstraint(item: personnelLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 360)])
    }
    
    func powLabelConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: powLabel, attribute: .top, relatedBy: .equal, toItem: personnelLabel, attribute: .bottom, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: powLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: powLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 80),
            NSLayoutConstraint(item: powLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 360)])
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
