//
//  ViewController.swift
//  EnemyLossesApp
//
//  Created by Nadia on 16.07.2022.
//

import UIKit


final class MenuViewController: UIViewController {

    private var collectionView: UICollectionView!
    private var presenter: MenuPresenter?
    
       
    lazy var titlelabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.text = "THE TOTAL COMBAT LOSSES OF THE ENEMY"
        label.font = .boldSystemFont(ofSize: 45)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.halfTextColorChange(fullText: label.text ?? "nil")
        
        return label
    }()
    
    override func loadView() {
        super.loadView()
        self.presenter = MenuPresenter(view: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "baseImage")!)
        navigationController?.navigationBar.tintColor = UIColor.red
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: ReuseIdentifier.menuCell)
        view.addSubview(titlelabel)
        view.addSubview(collectionView)
    }
    
    override func viewWillLayoutSubviews() {
        self.collectionViewConstraints()
        self.titleLabelConstraints()
    }

    func titleLabelConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: titlelabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 50),
            NSLayoutConstraint(item: titlelabel, attribute: .bottom, relatedBy: .equal, toItem: collectionView, attribute: .top, multiplier: 1, constant: 10),
            NSLayoutConstraint(item: titlelabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: titlelabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 220),
            NSLayoutConstraint(item: titlelabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 360)])
    }
    
    func collectionViewConstraints() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionView.topAnchor.constraint(equalTo: titlelabel.lastBaselineAnchor, constant: 10),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)])
    }

}

extension MenuViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.getMenu().count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifier.menuCell, for: indexPath) as? CollectionViewCell else { return CollectionViewCell()}
        
        cell.setup(with: presenter?.getMenu()[indexPath.row])
        
        return cell
    }
}

extension MenuViewController: UICollectionViewDelegate {
    
    internal func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.item {
        case 0:
            state = .personnel
        case 1:
            state = .equipment
        default:
            break
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) { [self] in
            navigationController?.pushViewController(MainViewController(), animated: true)
        }
    }
}

extension MenuViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width - 20, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets.init(top: 30, left: 0, bottom: 0, right: 0)
    }
}

extension UILabel {
    func halfTextColorChange(fullText: String) {
        let lastWord = fullText.components(separatedBy: " ").last
        
        let range = NSString(string: fullText).range(of: lastWord!)
        let attribute = NSMutableAttributedString(string: fullText)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: range)
        self.attributedText = attribute
    }
}


extension MenuViewController: MenuViewProtocol {
    func succes() {
        collectionView.reloadData()
    }
    func failure(_ error: Error) {
        print(error.localizedDescription)
    }
}

