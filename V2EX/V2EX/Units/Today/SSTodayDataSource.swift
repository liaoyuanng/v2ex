//
//  SSTodayDataSource.swift
//  V2EX
//
//  Created by Ju Liaoyuan on 2018/1/17.
//  Copyright © 2018年 Signularity Studio. All rights reserved.
//

import UIKit
import SwiftyJSON

class SSTodayDataSource: NSObject {
    
    struct TodayModel {
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
    }
    
    struct MemberModel {
        var id: Int?
        var username: String?
        var tagline: String?
        var avatar_mini: String?
        var avatar_normal: String?
        var avatar_large: String?
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
    }
    
    override init() {
        let todayUrl = URL.init(string: SSAPI.hot)
        let request = URLRequest.init(url: todayUrl!)
        let session = URLSession.init(configuration: URLSessionConfiguration.default)

        let dataTask = session.dataTask(with: request) { (data, resp, error) in
            print(data ?? "data is null")
            print(resp ?? "resp is null")
            print(error ?? "error is null")
            guard error == nil else { return }
        
//            let result = try? JSON(data: data!)
//
//            do {
//                let result = try foo()
//            } catch let why as YourError {
//                print(why) /// rename error as why
//            } catch YourError.NoHoney {
//                print("single" + "🐶")
//            }
        }
        dataTask.resume()
        super.init()
    }
    
    
    
    
    
}
