//
//  VideoModel.swift
//  OneSwiftDemoPerDay
//
//  Created by apple on 2017/7/18.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class VideoModel{
    var image: UIImage!
    var title = ""
    var source = ""
    var playImg = UIImage(named: "playBtn")
    init(image: UIImage!,title:String,source:String) {
        self.image = image
        self.title = title
        self.source = source
    }
    
    static func createVideoModel() -> [VideoModel]{
    return[
        VideoModel(image:UIImage(named:"videoScreenshot01"),title:"Introduce 3DS Mario",source:"Youtube - 06:32"),
        VideoModel(image:UIImage(named:"videoScreenshot02"),title:"Emoji Among Us",source:"Vimeo - 3:34"),
        VideoModel(image:UIImage(named:"videoScreenshot03"),title:"Seals Documentary",source:"Vine - 00:06"),
        VideoModel(image:UIImage(named:"videoScreenshot04"),title:"Adventure Time",source:"Youtube - 02:39"),
        VideoModel(image:UIImage(named:"videoScreenshot05"),title:"Facebook HQ",source:"Facebook - 10:20"),
        VideoModel(image:UIImage(named:"videoScreenshot06"),title:"Lijiang Lugu Lake",source:"Allen - 20:30")
        
        ]
    }
    
}
