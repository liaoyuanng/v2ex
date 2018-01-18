//
//  Int+Extension.swift
//  V2EX
//
//  Created by Ju Liaoyuan on 2018/1/18.
//  Copyright © 2018年 Signularity Studio. All rights reserved.
//

import Foundation

// Seconds per minute
let SPM = 60
// Seconds per hour
let SPH = 60 * 60
// Seconds per day
let SPD = 60 * 60 * 24

extension Int {
    
    func timestampFormatter(_ timestamp: Int) -> String {
        let dateFormatter = DateFormatter()
        let date = Date.init(timeIntervalSince1970: TimeInterval(timestamp))
        dateFormatter.dateFormat = "yyyy-MM-DD"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = NSLocale.current
        let result = dateFormatter.string(from: date)
        return result
    }
    
    func toDate() -> String {
        if self <= 0 { return "Unknow" }
        let nowTimestamp = Int(NSDate().timeIntervalSince1970) // current time stamp
//        print(timestampFormatter(nowTimestamp))
//        print(NSDate().timeIntervalSinceNow)
//        print(NSDate().timeIntervalSince1970)
   
        var result = String()
        let interval = nowTimestamp - self
        
        switch interval {
        case _ where interval < 0: result = "Future"
        case 0..<SPM: result = "刚刚"
        case SPM..<SPH: result = "\(interval / SPM)" + "分种前"
        case SPH..<SPD: result = "\(interval / SPH)" + "小时前"
        case SPD..<Int.max: result = timestampFormatter(interval)
        default: result = "Unknow"
            
        }
        return result
    }
}
