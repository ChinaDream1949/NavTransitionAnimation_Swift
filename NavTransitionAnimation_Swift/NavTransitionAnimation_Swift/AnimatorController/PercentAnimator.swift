//
//  PercentAnimator.swift
//  NavTransitionAnimation_Swift
//
//  Created by MR.Sahw on 2020/11/15.
//

import UIKit

class PercentAnimator: UIPercentDrivenInteractiveTransition {
    
    let detailVC : UIViewController
    var isInterActive = false
    
    init(detailVC : UIViewController) {
        self.detailVC = detailVC
        super.init()
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handelPan(pan:)))
        detailVC.view.addGestureRecognizer(pan)
    }
    @objc func handelPan(pan:UIPanGestureRecognizer){
        let progress = pan.translation(in: pan.view).x / 200
        
        switch pan.state {
        case .began:
            isInterActive = true
            detailVC.navigationController?.popViewController(animated: true)
        case .changed:
            update(progress)
        case .cancelled , .ended :
            isInterActive = false
            if progress > 0.5 {
                finish()
            }else{
                cancel()
            }
        default:
            break
        }
    }
}
