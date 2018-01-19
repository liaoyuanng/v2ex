//
//  SSCommunityViewController.swift
//  V2EX
//
//  Created by Ju Liaoyuan on 2017/10/27.
//  Copyright © 2017年 Signularity Studio. All rights reserved.
//

import UIKit

let cellID = "community_cellid"

class SSCommunityViewController: SSBaseViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: self.view.bounds, style: .plain)
        
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = SSRGB(226, 226, 226)
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
