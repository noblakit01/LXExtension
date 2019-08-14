//
//  UITableView.swift
//  LXExtension
//
//  Created by luan on 9/17/17.
//
//

import UIKit

public extension UITableView {
    
    func registerClass(of cell: UITableViewCell.Type) {
        register(cell, forCellReuseIdentifier: cell.identifier)
    }
    
    func registerNib(of cell: UITableViewCell.Type) {
        let nib = cell.nib
        register(nib, forCellReuseIdentifier: cell.identifier)
    }
    
    func registerHeaderFooterView(_ view: UIView.Type) {
        let nib = view.nib
        register(nib, forHeaderFooterViewReuseIdentifier: view.identifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(cellClass: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: cellClass.identifier, for: indexPath) as? T else {
            fatalError("Can't dequeue reusable cell with \(T.description())")
        }
        return cell
    }
    
    func dequeueReusableView<T: UIView>(_ view: UIView.Type) -> T {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: view.identifier) as? T else {
            fatalError("Can't dequeue reusable view with \(T.description())")
        }
        return view
    }
    
}
