//
//  SSTodayTableViewCell.swift
//  V2EX
//
//  Created by Ju Liaoyuan on 2018/1/16.
//  Copyright © 2018年 Signularity Studio. All rights reserved.
//

import UIKit
import SnapKit

class SSTodayTableViewCell: UITableViewCell {
    
    lazy var backView: UIView = {
        let backView = UIView()
        backView.backgroundColor = .white
        return backView
    }()
    
    lazy var avator: UIImageView = {
        let avator = UIImageView()
        return avator;
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 15);
        nameLabel.textColor = .black
        return nameLabel
    }()
    
    lazy var timeLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    
    lazy var titleLabel: UILabel = {
        let titlelabel = UILabel()
        titlelabel.font = UIFont.systemFont(ofSize: 15)
        titlelabel.textColor = .black
        return titlelabel
    }()
    
    lazy var summary: UILabel = {
        let summary = UILabel()
        summary.font = UIFont.systemFont(ofSize: 15)
        summary.textColor = .black
        return summary
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUI() {
        self.addSubview(backView)
        self.addSubview(avator)
        self.addSubview(nameLabel)
        self.addSubview(timeLable)
        self.addSubview(titleLabel)
        self.addSubview(summary)
        
        backView.backgroundColor = .gray
        avator.backgroundColor = .red
        nameLabel.backgroundColor = .green
        timeLable.backgroundColor = .blue
        titleLabel.backgroundColor = .orange
        summary.backgroundColor = .yellow
    }
    
    override func layoutSubviews() {
        
        backView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self)
            make.top.equalTo(self).offset(40)
        }
        
        avator.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(20)
            make.size.equalTo(CGSize.init(width: 60, height: 60))
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(avator.snp.right).offset(10)
            make.bottom.equalTo(backView.snp.top);
            make.right.equalTo(self).offset(-10)
            make.height.equalTo(20)
        }
        
        timeLable.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(nameLabel)
            make.top.equalTo(backView)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(10)
            make.right.equalTo(self).offset(-10)
            make.height.equalTo(30)
            make.top.equalTo(avator.snp.bottom).offset(10)
        }
        
        summary.snp.makeConstraints { (make) in
            make.left.right.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.bottom.equalTo(self).offset(-10)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
