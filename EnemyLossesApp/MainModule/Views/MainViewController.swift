//
//  ViewController.swift
//  EnemyLossesApp
//
//  Created by Nadia on 16.07.2022.
//

import UIKit

enum ReuseIdentifier {
    typealias RawValue = String
    static let personnelCell = "personnelCell"
    static let equipmentCell = "equipmentCell"
    static let menuCell = "menuCell"
}

enum ListVCState {
    case personnel
    case equipment
}

var state: ListVCState?

final class MainViewController: UIViewController {
    
    private var collectionView: UICollectionView!
    var presenter: MainPresenter?
    
    lazy var titlelabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.font = .boldSystemFont(ofSize: 70)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MainPresenter(view: self)
        view.backgroundColor = UIColor(patternImage: UIImage(named: "baseImage")!)
        view.addSubview(titlelabel)
        setUpCollectionView()
        fetchData()
        changeTheTextOfTheLabel()
    }
    
    override func viewWillLayoutSubviews() {
        self.collectionViewConstraints()
        self.titleLabelConstraints()
    }
    
    func changeTheTextOfTheLabel() {
        switch state {
        case .personnel:
            titlelabel.text = "Personnel"
        case .equipment:
            titlelabel.text = "Equipment"
        default:
            break
        }
    }
    
    func setUpCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(PersonnelViewCell.self, forCellWithReuseIdentifier: ReuseIdentifier.personnelCell)
        collectionView.register(EquipmentViewCell.self, forCellWithReuseIdentifier: ReuseIdentifier.equipmentCell)
        view.addSubview(collectionView)
    }
    
    func fetchData() {
        switch state {
        case .personnel:
            presenter?.getPersonnel()
        case .equipment:
            presenter?.getEquipment()
        default:
            break
        }
    }
    
    func titleLabelConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: titlelabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 50),
            NSLayoutConstraint(item: titlelabel, attribute: .bottom, relatedBy: .equal, toItem: collectionView, attribute: .top, multiplier: 1, constant: 10),
            NSLayoutConstraint(item: titlelabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: titlelabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150),
            NSLayoutConstraint(item: titlelabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 360)])
    }
    
    func collectionViewConstraints() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20)
        ])
    }
}


extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch state {
        case .personnel:
            return presenter?.personnelData().count ?? 0
        case .equipment:
            return presenter?.equipmentData().count ?? 0
        default:
            return 0
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch state {
        case .personnel:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifier.personnelCell, for: indexPath) as? PersonnelViewCell else {return PersonnelViewCell()}
            guard let personnel = presenter?.personnelData() else { return PersonnelViewCell()}
            cell.textLabel.text = String(describing: "Date \(String(describing: personnel[indexPath.row].date))")
            return cell
        case .equipment:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifier.equipmentCell, for: indexPath) as? EquipmentViewCell else {return EquipmentViewCell()}
            guard let equipment = presenter?.equipmentData() else { return EquipmentViewCell()}
            cell.textLabel.text = String(describing: "Date \(String(describing: equipment[indexPath.row].date))")
            return cell
        default:
            break
        }
        return CollectionViewCell()
    }
}

extension MainViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
    
        switch state {
        case .personnel:
            guard let personnel = self.presenter?.personnelData()[indexPath.row] else { return }
            detailVC.personnels = personnel
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [self] in
                navigationController?.pushViewController(detailVC, animated: true)
            }
        case .equipment:
            guard let equipment = self.presenter?.equipmentData()[indexPath.row] else { return }
            detailVC.equipments = equipment
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [self] in
                navigationController?.pushViewController(detailVC, animated: true)
            }

        default:
            break
        }
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width - 20, height: 100)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets.init(top: 10, left: 0, bottom: 0, right: 0)
    }
}

extension MainViewController: MainViewProtocol {
    func succes() {
        collectionView.reloadData()
    }
    func failure(error: Error) {
        print(error)
    }
}
