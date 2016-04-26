//
//  ViewController.swift
//  Zhizhi
//
//  Created by amoblin on 16/4/25.
//  Copyright © 2016年 marboo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let network = WANetwork.sharedInstance()
        network.apiRoot = "http://news-at.zhihu.com"
        let api = "/api/4/news/latest"
        network.requestWithPath(api, method: "GET", params: nil, success: { (result) in
            print(result)
            }, failure: { (response, error) in
                print(error)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

