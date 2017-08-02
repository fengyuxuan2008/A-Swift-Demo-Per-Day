//
//  ViewController.swift
//  SixteenthDay_makeTexturedEarth
//
//  Created by apple on 2017/8/2.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit
import SceneKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: SCNView!
    let scene = SCNScene()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.scene = scene
        sceneView.backgroundColor = UIColor.lightGray
        sceneView.autoenablesDefaultLighting = true
        
        let node = SCNNode()
        node.geometry = SCNSphere(radius: 1)
        node.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "diffuse")
        node.geometry?.firstMaterial?.specular.contents = UIImage(named: "specular")
        node.geometry?.firstMaterial?.emission.contents = UIImage(named: "emission")
        node.geometry?.firstMaterial?.normal.contents = UIImage(named: "normal")
    
        node.geometry?.firstMaterial?.transparency = 1
        node.geometry?.firstMaterial?.shininess = 1
        
        scene.rootNode.addChildNode(node)
        
        let action = SCNAction.rotate(by: 360 * CGFloat(Double.pi/180.0), around: SCNVector3(x: 0, y: 1, z: 0), duration: 8)
        
        let repeatAction = SCNAction.repeatForever(action)
        
        node.runAction(repeatAction)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

