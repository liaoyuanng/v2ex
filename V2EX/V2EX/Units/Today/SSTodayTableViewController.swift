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

    var dataSource = JSON.null
    let dataHandler = SSPostListDataSource.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Taday"
        
        tableView.register(SSTodayTableViewCell.self, forCellReuseIdentifier: todayListCellID)
        tableView.separatorStyle = .none
        tableView.separatorColor = .clear
        tableView.rowHeight = 150
        tableView.showsVerticalScrollIndicator = false
        
        dataHandler.request(SSAPI.hot) { (json) in
            self.dataSource = json
            self.tableView.reloadData()
        }
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
        cell.bindModel(PostListModel.init(dataSource[indexPath.row]))
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
    }

}
