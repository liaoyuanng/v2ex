//
//  SSConstants.swift
//  V2EX
//
//  Created by Ju Liaoyuan on 2018/1/17.
//  Copyright © 2018年 Signularity Studio. All rights reserved.
//

import UIKit

let baseURL = "https://www.v2ex.com"
let ScreenWidth = UIScreen.main.bounds.size.width
let ScreenHeight = UIScreen.main.bounds.size.height

enum SSAPI {
    static let hot = baseURL + "/api/topics/hot.json"
}

func SSRGB(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> UIColor {
    return SSRGBA(r, g, b, 1.0)
}

func SSRGBA(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat) -> UIColor {
    return UIColor.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}
