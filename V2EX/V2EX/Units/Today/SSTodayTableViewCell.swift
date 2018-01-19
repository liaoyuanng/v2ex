//
//  SSTodayTableViewCell.swift
//  V2EX
//
//  Created by Ju Liaoyuan on 2018/1/16.
//  Copyright © 2018年 Signularity Studio. All rights reserved.
//

import UIKit
import SnapKit
import SwiftyJSON
import Kingfisher

let PADDING: CGFloat = 10

class SSTodayTableViewCell: UITableViewCell {
    
    lazy var shadowLayer: CALayer = {
        let layer = CALayer()
        layer.frame = CGRect.init(x: 15, y: 15, width: ScreenWidth - 30, height: 120)
        layer.backgroundColor = UIColor.white.cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 6
        layer.shadowColor = SSRGBA(0, 0, 0, 0.5).cgColor
        layer.shadowOffset = CGSize.init(width: 0, height: 0)
        
        return layer
    }()
    
    lazy var backView: UIView = {
        let backView = UIView()
        backView.backgroundColor = .white
        backView.layer.cornerRadius = 6
        backView.layer.masksToBounds = true

        return backView
    }()
    
    lazy var contentBackView: UIView = {
        let contentBackView = UIView()
        contentBackView.backgroundColor = SSRGB(245, 245, 245)
        
        return contentBackView
    }()
    
    lazy var avator: UIImageView = {
        let avator = UIImageView()
        avator.layer.cornerRadius = 20
        avator.layer.masksToBounds = true
        
        return avator;
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = FontSize(12)
        nameLabel.textColor = .black
        
        return nameLabel
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.font = FontSize(10)
        label.textColor = SSRGBA(0, 0, 0, 0.7)
        
        return label
    }()
    
    lazy var titleLabel: UILabel = {
        let titlelabel = UILabel()
        titlelabel.font = FontSize(15)
        titlelabel.textColor = .black
        
        return titlelabel
    }()
    
    lazy var summary: UILabel = {
        let summary = UILabel()
        summary.font = FontSize(12)
        summary.textColor = SSRGBA(0, 0, 0, 0.7)
        summary.lineBreakMode = .byTruncatingTail
        summary.numberOfLines = 0
        
        return summary
    }()
    
    lazy var replies: UILabel = {
        let label = UILabel()
        label.font = FontSize(10)
        label.textColor = SSRGBA(0, 0, 0, 0.7)
        
        return label
    }()
    
    lazy var line: UIView = {
        let line = UIView()
        line.backgroundColor = SSRGBA(0, 0, 0, 0.7)
        
        return line
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        self.backgroundColor = .white
        initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUI() {
        self.layer.addSublayer(shadowLayer)
        self.addSubview(backView)
        backView.addSubview(contentBackView)
        backView.addSubview(avator)
        backView.addSubview(nameLabel)
        backView.addSubview(timeLabel)
        backView.addSubview(titleLabel)
        backView.addSubview(summary)
        backView.addSubview(replies)
        backView.addSubview(line)
//        backView.addSubview(touches)
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        backView.snp.makeConstraints { (make) in
            make.edges.equalTo(self).inset(PADDING)
        }
        
        contentBackView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(backView)
            make.top.equalTo(backView).offset(35)
        }
        
        avator.snp.makeConstraints { (make) in
            make.bottom.equalTo(contentBackView.snp.top).offset(20)
            make.left.equalTo(backView).offset(PADDING)
            make.size.equalTo(CGSize.init(width: 40, height: 40))
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(avator.snp.right).offset(10)
            make.bottom.equalTo(contentBackView.snp.top);
            make.right.equalTo(backView).offset(-10)
            make.height.equalTo(20)
        }
        
        timeLabel.snp.makeConstraints { (make) in
            make.left.height.equalTo(nameLabel)
            make.top.equalTo(contentBackView)
        }
        
        line.snp.makeConstraints { (make) in
            make.left.equalTo(timeLabel.snp.right).offset(2)
            make.size.equalTo(CGSize.init(width: 0.5, height: 10))
            make.centerY.equalTo(timeLabel)
        }
        
        replies.snp.makeConstraints { (make) in
            make.left.equalTo(line.snp.right).offset(2)
            make.centerY.equalTo(timeLabel)
            make.height.equalTo(15)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(backView).offset(10)
            make.right.equalTo(backView).offset(-10)
            make.height.equalTo(20)
            make.top.equalTo(avator.snp.bottom).offset(5)
        }
        
        summary.snp.makeConstraints { (make) in
            make.left.right.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom)
            make.bottom.equalTo(backView)
        }
    }
    
    func bindModel(_ model: PostListModel) {
        titleLabel.text = model.title
        summary.text = model.content
        nameLabel.text = model.member?.username
        timeLabel.text = model.created?.toDate()
        replies.text = "\(model.replies ?? 0)" + " 评论"
        avator.kf.setImage(with: (URL.init(string: "https:"+(model.member?.avatar_large)!)))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
