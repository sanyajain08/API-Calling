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
        let query = "//authenticjobs.com/api/?api_key=1de7c63a2e148d1f9af035a4906d21f4&method=aj.jobs.get&id=1569&format=JSON"
        if let url = URL(string: query) {
            if let data = try? Data(contentsOf: url) {
                let json = try! JSON(data: data)
                if json["status"] == "ok" {
                    parse(json: json)
                    return
                }
            }
        }
        self.loadError()
    }
    
    func parse(json: JSON) {
        for result in json["quote"].arrayValue {
            let id = result["id"].stringValue
            let title = result["title"].stringValue
            let description = result["description"].stringValue
            let job = ["id": id, "title": title, "description": description]
            quote.append(job)
            tableView.reloadData()
        }
    }
        
        func loadError() {
            let alert = UIAlertController(title: "Loading Error",
                                          message: "There was a problem loading the news feed",
                                          preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return quote.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell (withIdentifier: "Cell", for: indexPath)
        let job = quote[indexPath.row]
        cell.textLabel?.text = job["name"]
        cell.detailTextLabel?.text = job["description"]
        return cell
        }
        
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

