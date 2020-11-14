//
//  PushAnimator.swift
//  NavTransitionAnimation_Swift
//
//  Created by MR.Sahw on 2020/11/15.
//

import UIKit

class PushAnimator: NSObject ,UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        guard let fromView = transitionContext.view(forKey: .from),
              let toView  = transitionContext.view(forKey: .to) else {return}
        containerView.addSubview(toView)
        
        toView.transform = CGAffineTransform(translationX: containerView.bounds.width, y: 0)
        toView.alpha = 0
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext)) {
            fromView.transform = CGAffineTransform(translationX: -containerView.bounds.width, y: 0)
            fromView.alpha = 0
            
            toView.transform = .identity
            toView.alpha = 1
        } completion: { _ in
            fromView.transform  = .identity
            toView.transform = .identity
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }

    }
    
}
