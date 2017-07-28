//
//  NavigationControllerDelegate.swift
//  EleventhDay_CircleTransition(2)
//
//  Created by apple on 2017/7/28.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate{
    
    @IBOutlet weak var navigationController: UINavigationController?
    
    var interactionController: UIPercentDrivenInteractiveTransition?
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CircleTransitionAnimator()
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self.interactionController
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panned))
        self.navigationController?.view.addGestureRecognizer(panGesture)
    }
    
    func panned(gestureRecognizer: UIPanGestureRecognizer){
        switch gestureRecognizer.state {
        case .began:
            self.interactionController = UIPercentDrivenInteractiveTransition()
            if (self.navigationController?.viewControllers.count)! > 1{
                self.navigationController?.popViewController(animated: true)
            }else{
                self.navigationController?.topViewController?.performSegue(withIdentifier: "PushSegue", sender: nil)
            }
        case .changed:
            let translation = gestureRecognizer.translation(in: self.navigationController!.view)
            let completionProgress = translation.x/self.navigationController!.view.bounds.width
            self.interactionController?.update(completionProgress)
        case .ended:
            if (gestureRecognizer.velocity(in: self.navigationController!.view).x > 0){
                self.interactionController?.finish()
            }else{
                self.interactionController?.cancel()
            }
            self.interactionController = nil
            
        default:
            self.interactionController?.cancel()
            self.interactionController = nil
            
        }
    }
}
