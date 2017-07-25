//
//  TableViewController.swift
//  TheEighthDay_CoreData
//
//  Created by apple on 2017/7/25.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit
import CoreData
class TableViewController: UITableViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    //var datas = [["name": "五星红旗随风飘扬", "item": "飘到哪里哪里繁荣", "image": "jianjun1"],["name": "千山万水总是情", "item": "白首不相离", "image": "jianjun2"],["name": "疑是银河落九天", "item": "飞流直下三千尺", "image": "jianjun3"],["name": "十里杀一人", "item": "千里不留行", "image": "jianjun4"]]
    var presents = [Present]()
    
    var managedObjectContext:NSManagedObjectContext!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let iconImageView = UIImageView(image: UIImage(named:"jianjunjie"))
       iconImageView.tintColor = UIColor.clear
        self.navigationItem.titleView = iconImageView
      
        managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
        loadData()
    }
    
    func loadData(){
        let presentRequest: NSFetchRequest<Present> = Present.fetchRequest()
        do{
            presents = try managedObjectContext.fetch(presentRequest)
            self.tableView.reloadData()
        }catch{
            print("Could not load data from database \(error.localizedDescription)")
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
     
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return presents.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        let presentItem = presents[indexPath.row]
        
        if let presentImage = UIImage(data: presentItem.image! as Data){
            cell.backgroundImageView.image = presentImage
        }
        
       
        cell.nameLabel.text = presentItem.name
        cell.itemLabel.text = presentItem.item

        return cell
    }
    
    @IBAction func addPresent(_ sender: UIBarButtonItem) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            picker.dismiss(animated: true, completion: { 
                self.createPresentItem(with: image)
            })
        }
    }

    func createPresentItem(with image: UIImage){
        let presentItem = Present(context: managedObjectContext)
        presentItem.image = NSData(data: UIImageJPEGRepresentation(image, 0.3)!)
        
        let inputAlert = UIAlertController(title: "New Present", message: "enter a name and a item", preferredStyle: .alert)
        inputAlert.addTextField { (textField: UITextField) in
            textField.placeholder = "name"
        }
        inputAlert.addTextField { (textField: UITextField) in
            textField.placeholder = "item"
        }
        inputAlert.addAction(UIAlertAction(title: "Save", style: .default, handler: { (action: UIAlertAction) in
            let nameTextField = inputAlert.textFields?.first
            let itemTextField = inputAlert.textFields?.last
            if nameTextField?.text != "" && itemTextField?.text != ""{
                presentItem.name = nameTextField?.text
                presentItem.item = itemTextField?.text
                
                do{
                    try self.managedObjectContext.save()
                    self.loadData()
                }catch{
                    print("Could not save data \(error.localizedDescription)")
                }
                
            }
        }))
        inputAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(inputAlert, animated: true, completion: nil)
        
    }
   }
