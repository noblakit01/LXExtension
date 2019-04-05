//
//  UITableView.swift
//  LXExtension
//
//  Created by luan on 9/17/17.
//
//

import UIKit

extension UITableView {
    
    public func registerClass(of cell: UITableViewCell.Type) {
        register(cell, forCellReuseIdentifier: cell.identifier)
    }
    
    public func registerNib(of cell: UITableViewCell.Type) {
        let nib = cell.nib
        register(nib, forCellReuseIdentifier: cell.identifier)
    }
    
    public func registerHeaderFooterView(_ view: UIView.Type) {
        let nib = view.nib
        register(nib, forHeaderFooterViewReuseIdentifier: view.identifier)
    }
    
    public func dequeueReusableCell<T: UITableViewCell>(cellClass: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: cellClass.identifier, for: indexPath) as? T else {
            fatalError("Can't dequeue reusable cell with \(T.description())")
        }
        return cell
    }
    
}
