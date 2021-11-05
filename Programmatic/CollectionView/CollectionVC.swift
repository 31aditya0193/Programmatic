//
//  CollectionVC.swift
//  Programmatic
//
//  Created by Aditya Mishra on 05/11/21.
//

import UIKit

class CollectionVC: UIViewController {
    var numbersCollection: UICollectionView! {
        didSet {
            numbersCollection.dataSource = self
            numbersCollection.delegate = self
        }
    }
    
    var numbers = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Custom CollectionView"
        for i in 1...64 {
            numbers.append(i)
        }
        setupCollectionView()
    }
    
    func setupCollectionView() {
        let numbersLayout = CustomCollectionViewLayout()
        numbersCollection = UICollectionView(frame: .zero, collectionViewLayout: numbersLayout)
        numbersCollection.register(NumbersCollectionCell.self, forCellWithReuseIdentifier: "number")
        numbersCollection.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(numbersCollection)
        
        numbersCollection.topAnchor         .constraint(equalTo: view.topAnchor)        .isActive = true
        numbersCollection.leadingAnchor     .constraint(equalTo: view.leadingAnchor)    .isActive = true
        numbersCollection.trailingAnchor    .constraint(equalTo: view.trailingAnchor)   .isActive = true
        numbersCollection.bottomAnchor      .constraint(equalTo: view.bottomAnchor)     .isActive = true
    }
}

//MARK: UICollectionViewDataSource
extension CollectionVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "number", for: indexPath) as! NumbersCollectionCell
        cell.numberLabel.text = String(numbers[indexPath.item])
        let r = CGFloat.random(in: 0..<255)
        let g = CGFloat.random(in: 0..<255)
        let b = CGFloat.random(in: 0..<255)
        cell.backgroundColor = UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
        
        return cell
    }
}

//MARK: UICollectionViewDelegate
extension CollectionVC: UICollectionViewDelegate {
}
