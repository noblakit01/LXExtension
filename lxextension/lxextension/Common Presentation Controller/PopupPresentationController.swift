//
//  PopupPresentationController.swift
//  lxextension
//
//  Created by Tran Minh Luan on 12/03/2021.
//  Copyright © 2021 luantran. All rights reserved.
//

import UIKit

public class PopupPresentationController: UIPresentationController {
    
    fileprivate lazy var dimmingVisualView: UIVisualEffectView = {
        let effect = UIBlurEffect(style: .light)
        let view = UIVisualEffectView(effect: effect)
        return view
    }()
    
    public override var shouldRemovePresentersView : Bool {
        return false
    }
    
    public override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        
        dimmingVisualView.frame = containerView!.bounds
        containerView!.insertSubview(dimmingVisualView, at: 0)
        
        dimmingVisualView.alpha = 0
        if let transitionCoordinator = presentedViewController.transitionCoordinator {
            transitionCoordinator.animate(alongsideTransition: { _ in
                self.dimmingVisualView.alpha = 1
            }, completion: nil)
        }
    }
    
    public override func dismissalTransitionWillBegin() {
        super.dismissalTransitionWillBegin()
        
        if let transitionCoordinator = presentedViewController.transitionCoordinator {
            transitionCoordinator.animate(alongsideTransition: { _ in
                self.dimmingVisualView.alpha = 0
            }, completion: nil)
        }
    }
}
