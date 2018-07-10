//
//  ViewController.swift
//  API Calling
//
//  Created by Sanya Jain on 10/07/18.
//  Copyright © 2018 Sanya Jain. All rights reserved.
//

import UIKit

class JobbViewController: UITableViewController {
    var jobs = [[String: String]]()
    var apiKey = ""
    var job = [String: String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "JOBS"
        
        let query = "https://authenticjobs.com/api/?api_key=1de7c63a2e148d1f9af035a4906d21f4&method=aj.jobs.get&id=1569&format=JSON"
        DispatchQueue.global(qos: .userInitiated).async {
            [unowned self] in
            if let url = URL(string: query) {
                if let data = try? Data(contentsOf: url) {
                    let json = try! JSON(data: data)
                    if json["status"] == "ok" {
                        self.parse(json: json)
                        return
                    }
                }
            }
            self.loadError()
        }
    }
    
    func parse(json: JSON) {
        for result in json["jobs"].arrayValue {
            let title = result["title"].stringValue
            let description = result["description"].stringValue
            let url = result["url"].stringValue
            let work = ["title": title, "description": description, "url": url]
            jobs.append(work)
        }

    }
    
    func loadError() {
        DispatchQueue.global(qos: .userInitiated).async {
            [unowned self] in
            let alert = UIAlertController(title: "Loading Error",
                                          message: "There was a problem loading the news feed",
                                          preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobs.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell (withIdentifier: "Cell", for: indexPath)
        let work = jobs[indexPath.row]
        cell.textLabel?.text = work["title"]
        cell.detailTextLabel?.text = work["description"]
        return cell

    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


