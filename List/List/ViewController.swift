//
//  ViewController.swift
//  List
//
//  Created by Mary Paskhaver on 10/21/21.
//

import UIKit

class ViewController: UITableViewController {

    // Create toDos String array as a property of ViewController to hold default to-do data
    var toDos = ["Study Calculus", "Make lunch", "Do laundry"]
    
    // Whenever ViewController's add button is pressed, this function is called
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        // Create an alert that prompts the user to add a new to-do item
        let alert = UIAlertController(title: "Add a To-Do", message: "", preferredStyle: .alert)
        
        // Add a text field to that alert with a placeholder
        alert.addTextField { (toDoTextField) in
            toDoTextField.placeholder = "Enter a to-do."
        }
        
        // Create an alert action that puts a Done button on the alert and, when Done is pressed, gets the new to-do's text from the alert's text field, adds it to self.toDos, and refreshes ViewController's tableView so the new data shows up
        let alertAction = UIAlertAction(title: "Done", style: .default, handler: { (action) in
            let newToDo = alert.textFields![0].text!
            self.toDos.append(newToDo)
            self.tableView.reloadData()
        })

        // Add the action to the alert
        alert.addAction(alertAction)

        // Present the alert with an animation when the add button is pressed
        self.present(alert, animated: true)
    }
    
    // Loads the ViewController up
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Returns the number of rows in each section of ViewController's tableView. Since there is only 1 section, the number of rows in it is equal to the number of elements in ViewController's toDos property.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.toDos.count
    }
    
    // Handles filling cells with text from ViewController's toDos
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Gets proper text to put in cell at given indexPath
        let textToDisplay = self.toDos[indexPath.row]
        
        // Gets a UITableViewCell object with identifier "toDoCell" in ViewController's tableView at the given indexPath
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath)
        
        // Get the contentConfiguration of the cell and change its text to textToDisplay, declared and initialized above
        var content = cell.defaultContentConfiguration()
        content.text = textToDisplay
        
        // Reset cell's contentConfiguration to the new contentConfiguration called content whose text we changed
        cell.contentConfiguration = content
        
        // Return the cell
        return cell
    }

}
