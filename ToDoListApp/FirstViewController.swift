//
//  FirstViewController.swift
//  ToDoListApp
//
//  Created by Kioja Kudumu on 11/10/17.
//  Copyright © 2017 Kioja Kudumu. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    
    var items: [String] = []
    var desc: [String] = []
    var dates: [String] = []
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FirstViewControllerTableViewCell
        
        cell.textLabel?.text = items[indexPath.row]
        
        cell.descLabel?.text = desc[indexPath.row]
        
        cell.datesLabel?.text = dates[indexPath.row]
        
        return (cell)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
        
        if cell.accessoryType == .checkmark {
            cell.accessoryType = .none
        } else {
            cell.accessoryType = .checkmark
        }
    }
        
        
}
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete  {
            
            items.remove(at: indexPath.row)
            desc.remove(at: indexPath.row)
            dates.remove(at: indexPath.row)
            
            table.reloadData()
            
            UserDefaults.standard.set(items, forKey: "items")
            UserDefaults.standard.set(desc, forKey: "desc")
            UserDefaults.standard.set(dates, forKey: "dates")
            
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        let descObject = UserDefaults.standard.object(forKey: "desc")
        let datesObject = UserDefaults.standard.object(forKey: "dates")
        
        if let tempItems = itemsObject as? [String]{
            
            items = tempItems
    }

        if let tempDesc = descObject as? [String] {
            
            desc = tempDesc
        }
        if let tempDates = datesObject as? [String] {
            
            dates = tempDates
            
        }
        
        table.reloadData()
        
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


