//
//  CustomCollectionViewLayout.swift
//  Collection
//
//  Created by Aditya Mishra on 03/11/21.
//

import UIKit

class CustomCollectionViewLayout: UICollectionViewLayout {
    fileprivate var numberOfColumns = 4
    fileprivate var contentHeight: CGFloat = 0
    fileprivate var contentWidth: CGFloat {
        guard let collectionView = collectionView else { return 0 }
        return collectionView.bounds.width
    }
    fileprivate var columnWidth: CGFloat {
        return contentWidth / CGFloat(numberOfColumns)
    }
    fileprivate var cellHeight: CGFloat {
        return columnWidth
    }
    
    fileprivate var cache = [UICollectionViewLayoutAttributes]()
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func prepare() {
        guard
            cache.isEmpty,
            let collectionView = collectionView
        else { return }
        // 2
        var xOffset: [CGFloat] = []
        var yOffset: [CGFloat] = []
        var row = 0
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let col = item % numberOfColumns
            yOffset.append(cellHeight * CGFloat(row))
            xOffset.append(row % 2 == 0 ? columnWidth * CGFloat(col) : columnWidth * CGFloat(numberOfColumns - col - 1))
            if col == 3 {
                row += 1
            }
            
            let indexPath = IndexPath(item: item, section: 0)
            let frame = CGRect(x: xOffset[item],
                               y: yOffset[item],
                               width: columnWidth,
                               height: cellHeight)
            let insetFrame = frame.insetBy(dx: 0, dy: 0)
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = insetFrame
            cache.append(attributes)
            
            contentHeight = max(contentHeight, frame.maxY)
        }
    }
    
    //Is called  to determine which items are visible in the given rect
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
        
        for attribute in cache {
            if attribute.frame.intersects(rect) {
                visibleLayoutAttributes.append(attribute)
            }
        }
        
        return visibleLayoutAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
    
}
