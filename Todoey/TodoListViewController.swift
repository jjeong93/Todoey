//
//  ViewController.swift
//  Todoey
//
//  Created by Sookee on 14/01/2019.
//  Copyright © 2019 Sookee. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    //subclass uitableviewcontroller than don't need self.delegate or self.datasource ... etc

    let itemArray = ["FInd Mike", "Buy Eggos", "Destroy Demogorgon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK - Tableview Datasource Methods
    // 1. add number of row
    // 2. add cell for row at indexpath
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // reuse identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    // MARK - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(indexPath.row) // selected number
        //print(itemArray[indexPath.row]) // selected item
        
        // selected then accessory type change as checkmark
        //tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        // deselected then
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true) // color change when clicked
    }
}

