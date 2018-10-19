//
//  ViewController.swift
//  Todoey
//
//  Created by Amber-Lee Madigan on 10/17/18.
//  Copyright © 2018 The Code Goddess. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    let itemsArray = ["Take Saoirse to the Park", "Call Katanie", "Play Video Games with Chris"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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


}

