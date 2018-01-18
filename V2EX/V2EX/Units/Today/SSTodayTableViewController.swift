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
    let dataHandler = SSTodayDataSource.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Top 10"
        
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
        cell.bindModel(TodayModel.init(dataSource[indexPath.row]))
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
