//
//  SSCommunityViewController.swift
//  V2EX
//
//  Created by Ju Liaoyuan on 2017/10/27.
//  Copyright © 2017年 Signularity Studio. All rights reserved.
//

import UIKit
import SwiftyJSON

let cellID = "community_cellid"

class SSCommunityViewController: SSBaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight - 64 - 44), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 70
        tableView.separatorColor = SSRGB(226, 226, 226)
        tableView.register(SSCommunityTableViewCell.self, forCellReuseIdentifier: cellID)
        return tableView
    }()
    
    let dataHandler = SSPostListDataSource.init()
    var dataSource = JSON.null

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "V2EX"
        
        view.backgroundColor = .white
        self.view.addSubview(tableView)
        
        dataHandler.request(SSAPI.latest) { (data) in
            self.dataSource = try! data.merged(with: data).merged(with: data).merged(with: data).merged(with: data).merged(with: data)
            self.tableView.reloadData()
        }
        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! SSCommunityTableViewCell
        cell.bindModel(PostListModel.init(dataSource[indexPath.row]))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if cell.responds(to: #selector(setter: UITableViewCell.separatorInset)) {
            cell.separatorInset = .zero
        }
        if cell.responds(to: #selector(setter: UITableViewCell.layoutMargins)) {
            cell.layoutMargins = .zero
        }
        if cell.responds(to: #selector(setter: UITableViewCell.preservesSuperviewLayoutMargins)) {
            cell.preservesSuperviewLayoutMargins = false
        }
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
