//
//  MovieListVC.swift
//  OneSwiftDemoPerDay
//
//  Created by apple on 2017/7/18.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

private let VideoTableViewCell = "VideoTableViewCell"

class MovieListVC: UIViewController,UITableViewDelegate {
    fileprivate var videoDatas = VideoModel.createVideoModel()
    var playVC = AVPlayerViewController()
    var playerView = AVPlayer()
    var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Video List"
        tableView = UITableView.init(frame: view.bounds, style: .plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.backgroundColor = UIColor.white
        tableView?.tableFooterView = UIView()
        tableView?.register(MovieViewCell.self, forCellReuseIdentifier: VideoTableViewCell)
        view.addSubview(tableView!)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let path = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")
        playerView = AVPlayer(url: URL(fileURLWithPath: path!))
        playVC.player = playerView
        self.present(playVC, animated: true) { 
            self.playVC.player?.play()
        }
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension MovieListVC: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: VideoTableViewCell) as! MovieViewCell
        cell.videoData = videoDatas[indexPath.row]
        
        return cell
        
    }
}

