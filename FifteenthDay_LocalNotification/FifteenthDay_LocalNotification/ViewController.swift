//
//  ViewController.swift
//  FifteenthDay_LocalNotification
//
//  Created by apple on 2017/8/1.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       UNUserNotificationCenter.current().requestAuthorization(options: [.alert]) { (success, error) in
        if success {
            print("success")
        }else{
            print("error")
        }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sendNotification(_ sender: Any) {
        let content = UNMutableNotificationContent()
        content.title = "紧急通知"
        content.subtitle = "关于iPhone8"
        content.body = "听说价钱非常贵，样子非常丑~"
        
        let attachmentIdentifier = "ImageAttachmentIdentifier"
        // 附件URL
        if let url = Bundle.main.url(forResource: "applelogo.png", withExtension: nil) {
            do {
                let attachment = try UNNotificationAttachment(identifier: attachmentIdentifier, url: url, options: nil)
                content.attachments = [attachment]
                print("---")
            } catch {
                print(error)
            }
        }
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "notification.id.01", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error:Error?) in
            if error == nil{
                print("本地通知添加成功")
            }
        }
        
    }

}

