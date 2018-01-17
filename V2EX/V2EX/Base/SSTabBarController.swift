//
//  SSTabBarController.swift
//  V2EX
//
//  Created by Ju Liaoyuan on 2017/10/27.
//  Copyright © 2017年 Signularity Studio. All rights reserved.
//

import UIKit

class SSTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configSubViewControllers()
        // Do any additional setup after loading the view.
    }

    func configSubViewControllers() {
        let titles = ["今日热议","搜索","我的"]
        let images_n = ["tabbar_home_n","tabbar_home_n","tabbar_home_n"]
        let images_s = ["tabbar_home_s","tabbar_home_s","tabbar_home_s"]
        let vcNames = ["SSTodayTableViewController","SSCommunityViewController","SSMineViewController"];
        
        var vcs = [SSBaseNavigationController]()
        
        for (index, vcName) in vcNames.enumerated() {
            let cls = NSClassFromString("V2EX." + vcName) as! UIViewController.Type
            let vc = cls.init()
            vc.tabBarItem = UITabBarItem.init(title: titles[index], image: UIImage.init(named: images_n[index]), selectedImage: UIImage.init(named: images_s[index]))
            let nav = SSBaseNavigationController.init(rootViewController: vc)
            vcs.append(nav)
        }
        self.viewControllers = vcs
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
