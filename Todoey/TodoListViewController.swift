//
//  ViewController.swift
//  Todoey
//
//  Created by Amber-Lee Madigan on 10/17/18.
//  Copyright © 2018 The Code Goddess. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemsArray = ["Take Saoirse to the Park", "Call Katanie", "Play Video Games with Chris"]
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let items = defaults.array(forKey: "todos") as? [String] {
            itemsArray = items
        }
    }
    
    //MARK: - TableView DataSource Methods
    
    // cellForRowAtIndexPath
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = self.itemsArray[indexPath.row]
        
        return cell
    }
    
    // numberOfRowsInSection
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArray.count
    }
    
    //MARK: - Table Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentCell: UITableViewCell = tableView.cellForRow(at: indexPath)!
        
        if currentCell.accessoryType == .checkmark {
            currentCell.accessoryType = .none
        } else {
            currentCell.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - Add items
    
    @IBAction func addItemPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add new todoey", message: "", preferredStyle: .alert)
        let actionButton = UIAlertAction(title: "add this item", style: .default) { (action) in
            // what happens when the user clicks
            print("WE DID IT")
            if let textField = alert.textFields?.first {
                print(textField.text!)
                if !(textField.text?.isEmpty)! {
                    self.itemsArray.append(textField.text!)
                    self.tableView.reloadData()
                    self.defaults.set(self.itemsArray, forKey: "todos")
                }
            }
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Slay vampires"
        }
        
        alert.addAction(actionButton)
        // present the alert
        present(alert, animated: true, completion: nil)
    }
    

}

