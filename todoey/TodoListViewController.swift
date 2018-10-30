//
//  ViewController.swift
//  todoey
//
//  Created by VishalThakkar on 30/10/18.
//  Copyright © 2018 VishalThakkar. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

  let itemArray = ["find Mike","Buy Eggos","Destroy Demogorgon"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoitemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    //MARK - Tableview Delegate Method
    
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print (itemArray[indexPath.row])
    
    
    if  tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none     }
    else
    {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark    }
    
    tableView.deselectRow(at: indexPath, animated: true)
    
    }
}

