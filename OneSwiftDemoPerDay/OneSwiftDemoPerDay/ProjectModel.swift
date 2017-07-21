//
//  ProjectModel.swift
//  OneSwiftDemoPerDay
//
//  Created by apple on 2017/7/18.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class ProjectModel{
    var title = ""
    init(title: String){
        self.title = title
    }
    
    static func createProjectModel() -> [ProjectModel]{
        return [
            ProjectModel(title: "1. CollectionView Test"),
            ProjectModel(title: "2. Play Local Video"),
            ProjectModel(title: "3. IBDesignables"),
            ProjectModel(title: "4. Button Menu")
        ]
    }
}


