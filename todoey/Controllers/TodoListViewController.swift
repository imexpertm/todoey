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
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        print (dataFilePath)
        
       loadItems()
    
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
    
   self.saveItems()

   
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
            
          self.saveItems()
            
            
           // self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
            
    }
       
        
        alert.addTextField {(alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
            alert.addAction(action)
            present( alert, animated: true, completion: nil)
            
        
        }
    
    func saveItems(){
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(self.itemArray)
            try data.write(to : self.dataFilePath!)
        }
        catch
        {
            print ("Error in encoding")
        }
        
    }
    func loadItems(){
        if  let data = try? Data(contentsOf: dataFilePath!){
    
    let decoder = PropertyListDecoder()
            do {
        itemArray = try decoder.decode([Item].self, from: data)
    }
            catch
            {
                print("Error decoding item array")
            }

}
    

}

}
