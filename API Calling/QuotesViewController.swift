//
//  ViewController.swift
//  API Calling
//
//  Created by Sanya Jain on 10/07/18.
//  Copyright © 2018 Sanya Jain. All rights reserved.
//

import UIKit

class QuotesViewController: UITableViewController {
     var quote = [[String: String]]()
     let apiKey = "1de7c63a2e148d1f9af035a4906d21f4"
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "JOBS"
        let query = "https://authenticjobs.com/api/?api_key=" + apiKey + "&method=aj.jobs.get&id=1569"
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

