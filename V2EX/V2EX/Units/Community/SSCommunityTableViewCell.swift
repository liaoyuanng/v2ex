//
//  SSCommunityTableViewCell.swift
//  V2EX
//
//  Created by Ju Liaoyuan on 2018/1/19.
//  Copyright © 2018年 Signularity Studio. All rights reserved.
//

import UIKit

class SSCommunityTableViewCell: UITableViewCell {
    
//    lazy var avator: UIImageView = {
//        let imageView = UIImageView()
//    }()
//
//    lazy var nameLabel: UILabel = {
//
//    }()
//
//    lazy var nodeLabel: UILabel = {
//
//    }()
//
//    lazy var authorLabel: UILabel = {
//
//    }()
//
//    lazy var titleLabel: UILabel = {
//
//    }()
    

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
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
