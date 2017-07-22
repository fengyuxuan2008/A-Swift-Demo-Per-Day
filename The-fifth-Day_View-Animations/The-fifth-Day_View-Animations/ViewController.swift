//
//  ViewController.swift
//  The-fifth-Day_View-Animations
//
//  Created by apple on 2017/7/21.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1Constraint: NSLayoutConstraint!
    @IBOutlet weak var button2Constraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        button1Constraint.constant -= view.bounds.width
        button2Constraint.constant -= view.bounds.width
        
    }
    
    var animationPerformedOnce = false
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
        if !animationPerformedOnce{
            UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: {
                self.button1Constraint.constant += self.view.bounds.width
                self.view.layoutIfNeeded()
                
            }, completion: nil)
            
            UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: {
                self.button2Constraint.constant += self.view.bounds.width
                self.view.layoutIfNeeded()
                
            }, completion: nil)
            
            animationPerformedOnce = true
        }
        
    }
}

