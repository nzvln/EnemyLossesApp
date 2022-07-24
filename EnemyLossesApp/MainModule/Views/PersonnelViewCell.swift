//
//  MainViewCellCollectionViewCell.swift
//  EnemyLossesApp
//
//  Created by Nadia on 21.07.2022.
//

import UIKit

class PersonnelViewCell: UICollectionViewCell {
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.font = .boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 15
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(textLabel)
        contentView.backgroundColor = UIColor(named: "haki")
        layer.masksToBounds = true
        layer.cornerRadius = 16
        constraintsOfLabel()
    }
    
    override var isSelected: Bool {
        didSet {
            self.textLabel.alpha = isSelected ? 0.8 : 1.0
            self.textLabel.layer.borderWidth = isSelected ? 3 : 0
            self.textLabel.layer.borderColor = UIColor(named: "selectedColor")?.cgColor
            self.textLabel.layer.cornerRadius = 15
        }
    }
    
    func constraintsOfLabel() {
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            textLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            textLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
        ])
    }
    
    func setup(with text: String) {
        textLabel.text = text
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
