//
//  ButtonViewController.swift
//  The-fifth-Day_View-Animations
//
//  Created by apple on 2017/7/21.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class ButtonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func bounce(_ sender: Any) {
        let theButton = sender as! UIButton
        
        let bounds = theButton.bounds
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveEaseInOut, animations: { 
            theButton.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 30, height: bounds.size.height)
            
        }) { (success:Bool) in
            if success{
                UIView.animate(withDuration: 0.5, animations: { 
                    theButton.bounds = bounds
                })
            }
        }
    }
   
}
