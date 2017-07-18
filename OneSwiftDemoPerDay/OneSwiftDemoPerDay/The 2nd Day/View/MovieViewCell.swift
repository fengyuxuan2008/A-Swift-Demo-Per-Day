//
//  MovieViewCell.swift
//  OneSwiftDemoPerDay
//
//  Created by apple on 2017/7/18.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class MovieViewCell: UITableViewCell {
    var videoData: VideoModel!{
        didSet{
            updateUI()
        }
    }
    lazy var videoImgView = UIImageView()
    lazy var titleLabel = UILabel()
    lazy var sourceLabel = UILabel()
    lazy var playImgView = UIImageView()
    
    fileprivate func updateUI(){
        videoImgView.image = videoData.image
        titleLabel.text = videoData.title
        sourceLabel.text = videoData.source
        playImgView.image = videoData.playImg
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        initView()
    }
    
    func initView(){
        self.addSubview(videoImgView)
        videoImgView.snp.makeConstraints { (make) -> Void in
            make.top.left.equalToSuperview().offset(0)
            make.size.equalToSuperview()
        }
        
        videoImgView.addSubview(playImgView)
        playImgView.snp.makeConstraints { (make) -> Void in
            make.center.equalToSuperview()
            make.width.height.equalTo(60)
        }
        
        videoImgView.addSubview(titleLabel)
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.textAlignment = .center
        titleLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(playImgView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalToSuperview()
        }
        
        videoImgView.addSubview(sourceLabel)
        sourceLabel.textColor = UIColor.white
        sourceLabel.font = UIFont.boldSystemFont(ofSize: 12)
        sourceLabel.textAlignment = .center
        sourceLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalToSuperview()
        }
        
    }

}
