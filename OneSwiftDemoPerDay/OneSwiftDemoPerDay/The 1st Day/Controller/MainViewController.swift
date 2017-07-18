//
//  MainViewController.swift
//  OneSwiftDemoPerDay
//
//  Created by apple on 2017/7/17.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

private let CollectionCell = "CollectionCell"

class MainViewController: UIViewController{
    
    fileprivate var modelDatas = ModelData.createModelData()
    var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "About collectionView"
        let layout = UICollectionViewFlowLayout()
        let rect = CGRect(x: 10, y: 64, width: self.view.bounds.size.width, height: self.view.bounds.size.height - 64)
        layout.itemSize = CGSize(width:200,height:200)
        layout.minimumInteritemSpacing = 30
        layout.minimumLineSpacing = 30
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView.init(frame: rect, collectionViewLayout: layout)
        collectionView?.dataSource = self
        
        //注册一个cell
        collectionView!.register(CollectionViewCell.self, forCellWithReuseIdentifier:CollectionCell)
        collectionView?.backgroundColor = UIColor.white
        self.view.addSubview(collectionView!)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
    }
    
}

extension MainViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return modelDatas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCell, for: indexPath) as! CollectionViewCell
        cell.modelData = self.modelDatas[indexPath.section]
        
        return cell
    }
}
