//
//  CollectionViewCell.swift
//  OneSwiftDemoPerDay
//
//  Created by apple on 2017/7/17.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit
import SnapKit

class CollectionViewCell: UICollectionViewCell {
    var modelData: ModelData!{
        didSet{
            updateUI()
        }
    }
    lazy var imgView = UIImageView()
    lazy var label = UILabel()
    
    
    
    fileprivate func updateUI(){
        imgView.image = modelData.image
        label.text = modelData.title
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
      
         initView()
        
    }
    
    func initView(){
        self.addSubview(imgView)
    
        imgView.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(200)
            make.center.equalTo(self)
        }
        
        self.addSubview(label)
        label.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(100)
            make.height.equalTo(44)
            make.top.equalTo(imgView.snp.bottom).offset(10)
            make.centerX.equalTo(imgView)
        }
    }
}
