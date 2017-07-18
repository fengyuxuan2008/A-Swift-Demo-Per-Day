//
//  ModelData.swift
//  OneSwiftDemoPerDay
//
//  Created by apple on 2017/7/17.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class ModelData{
    //mark: - public API
    var title = ""
    var image: UIImage!
    init(title:String, image: UIImage!) {
        self.title = title
        self.image = image
    }

   
    //mark: - Private
    static func createModelData() -> [ModelData]{
        return [
        ModelData(title:"美女朋友圈1", image:UIImage(named:"美女朋友圈1.jpg")),
        ModelData(title:"美女朋友圈2", image:UIImage(named:"美女朋友圈2.jpg")),
        ModelData(title:"清纯", image:UIImage(named:"清纯.jpg")),
        ModelData(title:"美女朋友圈1", image:UIImage(named:"美女朋友圈1.jpg")),
        ModelData(title:"美女朋友圈2", image:UIImage(named:"美女朋友圈2.jpg")),
        ModelData(title:"清纯", image:UIImage(named:"清纯.jpg"))
        
        ]
    }
}
