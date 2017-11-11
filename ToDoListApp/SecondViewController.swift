//
//  SecondViewController.swift
//  ToDoListApp
//
//  Created by Kioja Kudumu on 11/10/17.
//  Copyright © 2017 Kioja Kudumu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var itemTextField: UITextField!
    
    @IBOutlet weak var descTextField: UITextView!
    
    @IBOutlet weak var dateSelector: UIDatePicker!
    
  // @IBOutlet weak var dateSelect: UIDatePicker!
    
    
    @IBAction func add(_ sender: Any) {
        
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        let descObject = UserDefaults.standard.object(forKey: "desc")
        let datesObject = UserDefaults.standard.object(forKey: "dates")
        
        var items: [String]
        var desc: [String]
        var dates: [String] = ["\(dateSelector.date)"]
        
        if let tempItems = itemsObject as? [String] {
            
            items = tempItems
            
            items.append(itemTextField.text!)
            
            
        } else {
            
            items = [itemTextField.text!]
            
        }
        
        if let tempDates = datesObject as? [String] {
            dates = tempDates
            
            dates.append("\(dateSelector.date)")
        } else {
            
            dates = ["\(dateSelector.date)"]
        }
            
 
        
        if let tempDesc = descObject as? [String] {
            
            desc = tempDesc
            
            desc.append(descTextField.text!)
            
        } else {
            
            desc = [descTextField.text!]
            
        }
        
        UserDefaults.standard.set(items, forKey: "items")
        UserDefaults.standard.set(desc, forKey: "desc")
        UserDefaults.standard.set(dates, forKey: "dates")
        itemTextField.text = ""
        descTextField.text = ""
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

