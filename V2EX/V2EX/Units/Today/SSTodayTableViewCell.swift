//
//  SSTodayTableViewCell.swift
//  V2EX
//
//  Created by Ju Liaoyuan on 2018/1/16.
//  Copyright © 2018年 Signularity Studio. All rights reserved.
//

import UIKit

class SSTodayTableViewCell: UITableViewCell {
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
    
    lazy var titleLabel: UILabel = {
        let titlelabel = UILabel()
        titlelabel.font = UIFont.systemFont(ofSize: 15)
        titlelabel.textColor = .black
        return titlelabel
    }()
    
    lazy var subTitleLabel: UILabel = {
        let subTitleLabel = UILabel()
        subTitleLabel.font = UIFont.systemFont(ofSize: 15)
        subTitleLabel.textColor = .black
        return subTitleLabel
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
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
