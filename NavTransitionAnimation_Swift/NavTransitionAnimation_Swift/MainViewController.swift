//
//  MainViewController.swift
//  NavTransitionAnimation_Swift
//
//  Created by MR.Sahw on 2020/11/15.
//

import UIKit

class MainViewController: UIViewController {

    var panInterAction : PercentAnimator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.delegate = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? DetailViewController {
            panInterAction = PercentAnimator(detailVC: detailVC)
        }
    }
}

extension MainViewController :  UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        switch operation {
        case .push:
            return PushAnimator()
        case .pop :
            return PopAnimator()
        default:
            return nil
        }
        
    }
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        guard let panInterAction = panInterAction , panInterAction.isInterActive else {return nil}
        return panInterAction
    }
}
