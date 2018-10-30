//  ViewController.swift
//  todoey
//
//  Created by VishalThakkar on 30/10/18.
//  Copyright © 2018 VishalThakkar. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

  var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let newitem = Item()
        newitem.title = "find MIke"
       itemArray.append(newitem)
        
        let newitem2 = Item()
        newitem2.title = "find Ben"
        itemArray.append(newitem2)
        
        let newitem3 = Item()
        newitem3.title = "find ken"
        itemArray.append(newitem3)
       
        
        
        
             if let items =  defaults.array(forKey: "TodoListArray") as? [Item]
     {
        itemArray = items

    }
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoitemCell", for: indexPath)
       let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
       //ternary operators
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    //MARK - Tableview Delegate Method
    
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print (itemArray[indexPath.row])
    itemArray[indexPath.row].done = !itemArray[indexPath.row].done
    
    
    
//    if itemArray[indexPath.row].done == false {
//        itemArray[indexPath.row].done = true    }
//    else
//    {
//        itemArray[indexPath.row].done = false
//
//    }
   
    tableView.reloadData()
    
    tableView.deselectRow(at: indexPath, animated: true)
    
    }


//MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
    
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Todoey Item" , message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title:  "Add Item", style: .default) { (action) in
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
            
    }
        alert.addTextField {(alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
            alert.addAction(action)
            present( alert, animated: true, completion: nil)
            
        
        }
    }
    



