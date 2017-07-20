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
    
    fileprivate var projectModelDatas = ProjectModel.createProjectModel()
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
        let secondVC = MovieListVC()
        let sto = UIStoryboard.init(name: "Storyboard", bundle: nil)
       let thirdVC = sto.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(firstVC, animated: true)
        case 1:
            self.navigationController?.pushViewController(secondVC, animated: true)
        case 2:
            self.navigationController?.pushViewController(thirdVC, animated: true)
        default:
            break
            
        }
    }
}

extension ViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projectModelDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell()
      
        cell.textLabel?.text = projectModelDatas[indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}
