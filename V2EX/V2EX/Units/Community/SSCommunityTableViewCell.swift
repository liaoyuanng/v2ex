//
//  SSCommunityTableViewCell.swift
//  V2EX
//
//  Created by Ju Liaoyuan on 2018/1/19.
//  Copyright © 2018年 Signularity Studio. All rights reserved.
//

import UIKit


class SSCommunityTableViewCell: UITableViewCell {
    
    lazy var avator: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 4
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    lazy var line: UIView = {
        let view = UIView()
        view.backgroundColor = lightGray
        
        return view
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = lightGray
        label.font = FontSize(10)
        
        return label
    }()
    
    lazy var replies: UILabel = {
        let label = UILabel()
        label.textColor = lightGray
        label.font = FontSize(10)
        
        return label
    }()

    lazy var nodeLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = Gray
        label.textColor = .white
        label.layer.cornerRadius = 4
        label.layer.masksToBounds = true
        label.textAlignment = .center
        label.font = FontSize(10)
        
        return label
    }()

    lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.textColor = Gray
        label.font = FontSize(12)
        
        return label
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Gray
        label.font = UIFont.systemFont(ofSize: 14)
        label.lineBreakMode = .byTruncatingTail
        
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUI() {
        self.addSubview(avator)
        self.addSubview(titleLabel)
        self.addSubview(nodeLabel)
        self.addSubview(authorLabel)
        self.addSubview(timeLabel)
        self.addSubview(line)
        self.addSubview(replies)
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        avator.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(10)
            make.top.equalTo(self).offset(10)
            make.size.equalTo(CGSize.init(width: 30, height: 30))
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(10)
            make.right.equalTo(self).offset(-10)
            make.top.equalTo(avator.snp.bottom)
            make.bottom.equalTo(self)
        }
        
        nodeLabel.snp.makeConstraints { (make) in
            make.right.equalTo(titleLabel)
            make.centerY.equalTo(avator)
        }
        
        authorLabel.snp.makeConstraints { (make) in
            make.top.equalTo(avator)
            make.left.equalTo(avator.snp.right).offset(10)
        }
        
        timeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(authorLabel)
            make.bottom.equalTo(avator)
        }
        
        line.snp.makeConstraints { (make) in
            make.left.equalTo(timeLabel.snp.right).offset(3)
            make.centerY.equalTo(timeLabel)
            make.size.equalTo(CGSize.init(width: 0.5, height: 10))
        }
        
        replies.snp.makeConstraints { (make) in
            make.left.equalTo(line.snp.right).offset(3)
            make.centerY.equalTo(timeLabel)
        }
        
        
    }
    
    func bindModel(_ model: PostListModel) {
        titleLabel.text = model.title
//        summary.text = model.content
        authorLabel.text =
            model.member?.username
        timeLabel.text = model.created?.toDate()
        replies.text = "\(model.replies ?? 0)" + " 评论"
        nodeLabel.text = model.node?.title
        avator.kf.setImage(with: (URL.init(string: "https:"+(model.member?.avatar_normal)!)))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
