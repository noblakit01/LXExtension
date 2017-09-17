//
//  UITableView.swift
//  LXExtension
//
//  Created by luan on 9/17/17.
//
//

import UIKit

extension UITableView {
    func register(cellType: UITableViewCell.Type) {
        let nib = cellType.nib
        register(nib, forCellReuseIdentifier: cellType.identifier)
    }
    
    func registerHeaderFooterView(_ view: UIView.Type) {
        let nib = view.nib
        register(nib, forHeaderFooterViewReuseIdentifier: view.identifier)
    }
}
