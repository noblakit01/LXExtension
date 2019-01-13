//
//  UICollectionView.swift
//  LXExtension
//
//  Created by luan on 9/17/17.
//
//

import UIKit

extension UICollectionView {
    
    public func indexPathsForElements(in rect: CGRect) -> [IndexPath] {
        guard let allLayoutAttributes = collectionViewLayout.layoutAttributesForElements(in: rect) else {
            return []
        }
        return allLayoutAttributes.map { $0.indexPath }
    }
    
}

extension UICollectionView {
    
    public func registerClass(of cell: UICollectionViewCell.Type) {
        register(cell, forCellWithReuseIdentifier: cell.identifier)
    }
    
    public func registerNib(of cell: UICollectionViewCell.Type) {
        register(cell.nib, forCellWithReuseIdentifier: cell.identifier)
    }
    
    public func dequeueReusableCell<T: UICollectionViewCell>(cellClass: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: cellClass.identifier, for: indexPath) as? T else {
            fatalError("Can't dequeue reusable cell with \(T.description())")
        }
        return cell
    }
    
}
