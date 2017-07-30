//
//  ViewController.swift
//  ThirteenthDay_Calculator
//
//  Created by apple on 2017/7/28.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTyping = false

    @IBAction func touchDigit(_ sender: UIButton) {
       let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping{
       let textCurrentlyInDisplay = display.text!
        display.text = textCurrentlyInDisplay + digit
       
        }else{
            display.text = digit
            userIsInTheMiddleOfTyping = true
        }
    }
    
    var displayValue: Double {
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        userIsInTheMiddleOfTyping = false
        if let mathematicalSymbol = sender.currentTitle{
            switch mathematicalSymbol {
            case "π":
                displayValue = Double.pi
            
            case "√":
                displayValue = sqrt(displayValue)
            default:
                break
            }
        }
        
    }
    
}

