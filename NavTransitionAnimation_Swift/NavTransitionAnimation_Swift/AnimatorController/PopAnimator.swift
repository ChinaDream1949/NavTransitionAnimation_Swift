//
//  PopAnimator.swift
//  NavTransitionAnimation_Swift
//
//  Created by MR.Sahw on 2020/11/15.
//

import UIKit

class PopAnimator: NSObject , UIViewControllerAnimatedTransitioning{
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        guard let fromView = transitionContext.view(forKey: .from),
              let toView  = transitionContext.view(forKey: .to) else {return}
        containerView.insertSubview(toView, belowSubview: fromView)
        
        fromView.layer.shadowOpacity = 0.5 // 阴影
        fromView.layer.shadowRadius  = 10
        fromView.layer.shadowPath    = UIBezierPath(rect: fromView.bounds).cgPath // 规定渲染大小 防止实时计算大小 减少渲染
        
        toView.transform = CGAffineTransform(translationX: -containerView.bounds.width/3, y: 0)
        toView.alpha = 1
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext)) {
            fromView.transform = CGAffineTransform(translationX: containerView.bounds.width, y: 0)
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
