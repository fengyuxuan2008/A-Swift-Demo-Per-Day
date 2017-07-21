//
//  MoreButtonViewController.swift
//  OneSwiftDemoPerDay
//
//  Created by apple on 2017/7/21.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class MoreButtonViewController: UIViewController {

    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var movieButton: UIButton!
    @IBOutlet weak var cultureButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    var moreBtnCenter: CGPoint!
    var movieBtnCenter: CGPoint!
    var cultureCenter: CGPoint!
    var playBtnCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieBtnCenter = movieButton.center
        cultureCenter = cultureButton.center
        playBtnCenter = playButton.center
        
        movieButton.center = moreButton.center
        cultureButton.center = moreButton.center
        playButton.center = moreButton.center
    
    }
    
    
    @IBAction func moreButtonClick(_ sender: UIButton) {
        if moreButton.currentImage == #imageLiteral(resourceName: "moreBtn"){
            UIView.animate(withDuration: 0.3, animations: { 
                //animations here
                self.movieButton.alpha = 1
                self.cultureButton.alpha = 1
                self.playButton.alpha = 1
                self.movieButton.center = self.movieBtnCenter
                self.cultureButton.center = self.cultureCenter
                self.playButton.center = self.playBtnCenter
              
            })
            
        }else{
            //collapse buttons
            
            UIView.animate(withDuration: 0.3, animations: { 
                
                self.movieButton.alpha = 0
                self.cultureButton.alpha = 0
                self.playButton.alpha = 0
                self.movieButton.center = self.moreButton.center
                self.cultureButton.center = self.moreButton.center
                self.playButton.center = self.moreButton.center
                
            })
            
        }
        toggleButton(button: sender, onImage: #imageLiteral(resourceName: "moreBtn"), offImage: #imageLiteral(resourceName: "tabbar_compose_background_icon_add"))
        
    }
    
    func toggleButton(button: UIButton, onImage:UIImage,offImage:UIImage){
        if button.currentImage == offImage{
            button.setImage(onImage, for: .normal)
        }else{
            button.setImage(offImage, for: .normal)
        }
    }
    

 }
