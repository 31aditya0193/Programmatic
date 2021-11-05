//
//  NumbersCollectionCell.swift
//  Collection
//
//  Created by Aditya Mishra on 03/11/21.
//

import UIKit

class NumbersCollectionCell: UICollectionViewCell {
    var numberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        contentView.addSubview(numberLabel)
        
        numberLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        numberLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        numberLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        numberLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
