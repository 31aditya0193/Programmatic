//
//  DefaultCollection.swift
//  Programmatic
//
//  Created by Aditya Mishra on 14/11/21.
//

import UIKit

class DefaultCollectionVC: UIViewController {
    var lettersCollection: UICollectionView! {
        didSet {
            lettersCollection.dataSource = self
            lettersCollection.delegate = self
        }
    }
    
    var letters = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Default CollectionView"
        for l in 65..<91 {
            letters.append(String(UnicodeScalar(UInt8(l))))
        }
        setupCollectionView()
    }
    
    func setupCollectionView() {
        lettersCollection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        lettersCollection.register(NumbersCollectionCell.self, forCellWithReuseIdentifier: "number")
        lettersCollection.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(lettersCollection)
        
        lettersCollection.topAnchor         .constraint(equalTo: view.topAnchor)        .isActive = true
        lettersCollection.leadingAnchor     .constraint(equalTo: view.leadingAnchor)    .isActive = true
        lettersCollection.trailingAnchor    .constraint(equalTo: view.trailingAnchor)   .isActive = true
        lettersCollection.bottomAnchor      .constraint(equalTo: view.bottomAnchor)     .isActive = true
    }
}

extension DefaultCollectionVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return letters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "number", for: indexPath) as! NumbersCollectionCell
        cell.numberLabel.text = String(letters[indexPath.item])
        let r = CGFloat.random(in: 0..<255)
        let g = CGFloat.random(in: 0..<255)
        let b = CGFloat.random(in: 0..<255)
        cell.numberLabel.textColor = UIColor(red: r/255, green: r/255, blue: r/255, alpha: 1)
        cell.backgroundColor = UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
        return cell
    }
    
    
}

extension DefaultCollectionVC: UICollectionViewDelegate {
    
}
