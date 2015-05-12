//
//  ListTableViewController.swift
//  HighPriority
//
//  Created by Whitney Lauren on 5/11/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit

enum Priority  {
    
    case High
    case Medium
    case Low
    
}

class ListTableViewController: UITableViewController {
    
    // [String] = means working with an array of strings.
    // [String:String] = dictionary. Key and value are both strings.
    
    var priorityChoice = 0

    
    var listItems: [[String:AnyObject]] = [
        
        [
        
            "name" : "Play with birds",
            "timeCreated" : NSDate(),
            "priority" : 0,
            "completed" : false
            
        ],
    
        [
    
            
            
            
            
            
            "name" : "Nest",
            "timeCreated" : NSDate(),
            "priority" : 2,
            "completed" : false
            
            
            ]
        ]
    
   
    @IBOutlet weak var highButton: PriorityButton!
    
    @IBOutlet weak var mediumButton: PriorityButton!
    
    @IBOutlet weak var lowButton: PriorityButton!
    
    @IBAction func High(sender: PriorityButton) {
    
        priorityChoice = 0
        
//        sender.layer.cornerRadius = sender.bounds.size.width / 2
//        sender.hasBeenSelected = true
//        sender.setNeedsDisplay()
//        
//        mediumButton.hasBeenSelected = false
//        lowButton.hasBeenSelected = false
    }
    
    @IBAction func Medium(sender: PriorityButton) {
        
        priorityChoice = 1
        
    }
    
    @IBAction func Low(sender: PriorityButton) {
        
        priorityChoice = 2
        
    }
    
    @IBOutlet weak var itemNameField: UITextField!
    
    
    @IBAction func createItem(sender: AnyObject) {
        

        
        var itemInfo = [
        
            
            "name" : itemNameField.text,
            "timeCreated" : NSDate(),
            "priority" : priorityChoice,
            "completed" : false
    
        
        ]
   
        listItems.insert(itemInfo, atIndex: 0)
//        listItems.append(itemInfo)
        
        tableView.reloadData()
        
    
    
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        highButton.layer.cornerRadius = highButton.bounds.size.width / 2
        
        mediumButton.layer.cornerRadius = highButton.bounds.size.width / 2
        
        lowButton.layer.cornerRadius = lowButton.bounds.size.width / 2 

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

   // override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        //return 0
   // }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return listItems.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("listCell", forIndexPath: indexPath) as! ListTableViewCell
        
        cell.itemInfo = listItems [indexPath.row]
        
        
        
        

        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            
            listItems.removeAtIndex(indexPath.row)
            
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}