//
//  SSBaseNavigationController.swift
//  V2EX
//
//  Created by Ju Liaoyuan on 2018/1/17.
//  Copyright © 2018年 Signularity Studio. All rights reserved.
//

import UIKit

class SSBaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isTranslucent = false
        
        // remove navigation bar 1px bottom line
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        
        navigationBar.layer.cornerRadius = 2
        navigationBar.layer.shadowOpacity = 0.8
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
