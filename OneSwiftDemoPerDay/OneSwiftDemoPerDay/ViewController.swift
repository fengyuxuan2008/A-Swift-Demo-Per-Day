//
//  ViewController.swift
//  OneSwiftDemoPerDay
//
//  Created by apple on 2017/7/17.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit
private let TableViewCell = "TableViewCell"
class ViewController: UIViewController,UITableViewDelegate {
    
    var tableView: UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "每天一个小项目"
        tableView = UITableView.init(frame: view.frame, style: .plain)
        
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.backgroundColor = UIColor.white
        tableView?.tableFooterView = UIView()
        view.addSubview(tableView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let firstVC = MainViewController()
        self.navigationController?.pushViewController(firstVC, animated: true)
    }


}

extension ViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell()
      
        cell.textLabel?.text = String.init(format: "%dst CollectionView Test", indexPath.row + 1)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}
