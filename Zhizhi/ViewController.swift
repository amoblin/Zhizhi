//
//  ViewController.swift
//  Zhizhi
//
//  Created by amoblin on 16/4/25.
//  Copyright © 2016年 marboo. All rights reserved.
//

import UIKit

class ViewController: DDBaseTableViewController {
    let network = WANetwork.sharedInstance()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        network.apiRoot = "http://news-at.zhihu.com"
        
    }
    
    override func refreshDataForce() {
        super.refreshDataForce()
        network.requestWithPath("/api/4/news/latest", method: "GET", params: nil, success: { (result) in
            print(result)
            self.presentData(result as! [String:AnyObject])
            }, failure: { (response, error) in
                print(error)
        })
    }
    
    func presentData(result:[String:AnyObject]) {
        let bannerData = DDBannerTableViewData()
        bannerData.dataArray = result["top_stories"] as! Array
        self.dataArray = [bannerData]
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

