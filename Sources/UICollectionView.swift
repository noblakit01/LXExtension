//
//  UICollectionView.swift
//  LXExtension
//
//  Created by luan on 9/17/17.
//
//

import UIKit

extension UICollectionView {
    public func register(cellType: UICollectionViewCell.Type) {
        let nib = cellType.nib
        let identifier = cellType.identifier
        register(nib, forCellWithReuseIdentifier: identifier)
    }
}
