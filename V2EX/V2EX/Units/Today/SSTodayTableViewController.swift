//
//  SSTodayTableViewController.swift
//  V2EX
//
//  Created by Ju Liaoyuan on 2018/1/16.
//  Copyright © 2018年 Signularity Studio. All rights reserved.
//

let todayListCellID = "_todaylist_cell"

import UIKit
import SwiftyJSON

class SSTodayTableViewController: UITableViewController {
    
    var dataSource = Array<PostListModel>.init()
    let dataHandler = SSPostListDataSource.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Taday"
        
        tableView.register(SSTodayTableViewCell.self, forCellReuseIdentifier: todayListCellID)
        tableView.separatorStyle = .none
        tableView.separatorColor = .clear
        tableView.showsVerticalScrollIndicator = false
        
        dataHandler.request(SSAPI.hot) { (datas) in
            
            self.dataSource = datas
            self.tableView.reloadData()
        }
        
        let fpsLabel = SSFPSLabel.init(frame: .zero)
        UIApplication.shared.keyWindow?.addSubview(fpsLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: todayListCellID, for: indexPath) as! SSTodayTableViewCell
        cell.bindModel(dataSource[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return dataSource[indexPath.row].height ?? 150.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
    }

}
