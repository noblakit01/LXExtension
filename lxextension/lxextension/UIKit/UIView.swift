//
//  UIView.swift
//  LXExtension
//
//  Created by luan on 9/17/17.
//
//

import UIKit

extension UIView {
    
    public class func fromNib<T : UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
    public class var nib: UINib {
        get {
            let nibName = String(describing: self)
            let bundle = Bundle(for: self)
            return UINib(nibName: nibName, bundle: bundle)
        }
    }
    
    public class var identifier: String {
        get {
            return String(describing: self)
        }
    }
    
    @available(iOS 9.0, *)
    func startLoading() -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let dimmingView = UIView()
        dimmingView.translatesAutoresizingMaskIntoConstraints = false
        dimmingView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
        let indicatorView = UIActivityIndicatorView(style: .whiteLarge)
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        indicatorView.startAnimating()
        
        view.addSubview(dimmingView)
        view.addSubview(indicatorView)
        
        dimmingView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        dimmingView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        dimmingView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        dimmingView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        indicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        indicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        addSubview(view)
        view.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        return view
    }
    
}
