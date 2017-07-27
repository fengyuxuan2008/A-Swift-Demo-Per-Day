//
//  SecondViewController.swift
//  TenthDay_circleTransition
//
//  Created by apple on 2017/7/27.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissClick(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
