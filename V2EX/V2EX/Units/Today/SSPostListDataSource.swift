//
//  SSPostListDataSource.swift
//  V2EX
//
//  Created by Ju Liaoyuan on 2018/1/17.
//  Copyright © 2018年 Signularity Studio. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class PostListModel: NSObject {
    var id: Int?
    var title: String?
    var url: String?
    var content: String?
    var content_rendered: String?
    var replies: Int?
    var member: MemberModel?
    var node: NodeModel?
    var created: Int?
    var last_modified: Int?
    var last_touched: Int?
    var height: CGFloat?
    
    
    init(_ json: JSON) {
        
        super.init()
        
        id = json["id"].int
        title = json["title"].string
        url = json["url"].string
        content = json["content"].string
        content_rendered = json["content_rendered"].string
        replies = json["replies"].int
        created = json["created"].int
        last_modified = json["last_modified"].int
        last_touched = json["last_touched"].int
        member = MemberModel.init(json["member"])
        node = NodeModel.init(json["node"])
        
        calculateTextSize()
    }
    
    func calculateTextSize() {
        
        let calculateQueue = DispatchQueue.init(label: "com.v2ex.calculateHeight")
        calculateQueue.async {
            let titleString = self.title! as NSString
            let titleHeight = titleString.boundingRect(with: CGSize.init(width: ScreenWidth - 40, height: CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15)], context: nil).height
            let contentHeight = self.content?.count == 0 ? 0.0 : 20.0;
            self.height = titleHeight + CGFloat(contentHeight) + 60.0 + 30.0
        }
    }
}

struct MemberModel {
    var id: Int?
    var username: String?
    var tagline: String?
    var avatar_mini: String?
    var avatar_normal: String?
    var avatar_large: String?
    
    init(_ json: JSON) {
        id = json["id"].int
        username = json["username"].string
        tagline = json["tagline"].string
        avatar_mini = json["avatar_mini"].string
        avatar_normal = json["avatar_normal"].string
        avatar_large = json["avatar_large"].string
    }
}

struct NodeModel {
    var id: Int?
    var name: String?
    var title: String?
    var title_alternative: String?
    var url: String?
    var topics: String?
    var avatar_mini: String?
    var avatar_normal: String?
    var avatar_large: String?
    
    init(_ json: JSON) {
        id = json["id"].int
        name = json["name"].string
        title = json["title"].string
        title_alternative = json["title_alternative"].string
        url = json["url"].string
        topics = json["topics"].string
        avatar_mini = json["avatar_mini"].string
        avatar_normal = json["avatar_normal"].string
        avatar_large = json["avatar_large"].string
    }
}

class SSPostListDataSource: NSObject {
    
    func request(_ urlString: String, completionHandler: @escaping (Array<PostListModel>) -> Void) {
        Alamofire.request(urlString).responseJSON { (response) in
            guard response.result.isSuccess else {
                return;
            }
            let json = JSON(response.result.value!)
            
            var models = Array<PostListModel>.init()
            for (_, subJson) in json {
                models.append(PostListModel.init(subJson))
            }
            completionHandler(models)
        }
    }
}
