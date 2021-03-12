//
//  SlideInTransitioning.swift
//  lxextension
//
//  Created by Tran Minh Luan on 12/03/2021.
//  Copyright © 2021 luantran. All rights reserved.
//

import UIKit

public class SlideInTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from) {
            let containerView = transitionContext.containerView
            
            fromView.center.y += containerView.bounds.height
            let duration = transitionDuration(using: transitionContext) as TimeInterval
            UIView.animate(withDuration: duration, animations: {
                fromView.center.y = 0.0
                fromView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            }, completion: { finished in
                    transitionContext.completeTransition(finished)
            })
        }
    }
}
