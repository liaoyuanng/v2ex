//
//  SSFPSLabel.swift
//  V2EX
//
//  Created by Ju Liaoyuan on 2018/3/5.
//  Copyright © 2018年 Signularity Studio. All rights reserved.
//

import UIKit

class SSFPSLabel: UILabel {

    var link: CADisplayLink?
    var lastTime = 0.0
    var count = 0
    
    
    override init(frame: CGRect) {
        
        super.init(frame: CGRect.init(x: 10, y: 20, width: 100, height: 20))
        layer.cornerRadius = 5
        layer.masksToBounds = true
        self.backgroundColor = .black
        self.textColor = .white
        
        link = CADisplayLink.init(target: self, selector: #selector(refreshLabel))
        
        link?.add(to: .main, forMode: .commonModes)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func refreshLabel() {
        
        guard lastTime != 0 else {
            lastTime = link?.timestamp ?? 0.0
            return
        }
        count += 1
        let delta = (link?.timestamp)! - lastTime
        if delta < 1 {
            return
        }
        
        lastTime = (link?.timestamp)!
        let fps = Double(count) / delta
        count = 0
        
        self.text = "\(round(fps)) FPS"
        
    }

}
