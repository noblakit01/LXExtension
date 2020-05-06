//
//  UIViewController.swift
//  lxextension
//
//  Created by Luan Tran on 5/4/20.
//  Copyright © 2020 luantran. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    func presentErrorAlert(withTitle title: String = "Unexpected Failure", message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        present(alertController, animated: true)
    }
    
    func presentError(_ error: NSError, title: String = "Failed with error %d") {
        presentErrorAlert(withTitle: String(format: title, error.code), message: error.localizedDescription)
    }
    
}
