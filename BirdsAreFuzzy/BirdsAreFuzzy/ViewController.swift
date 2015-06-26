//
//  ViewController.swift
//  BirdsAreFuzzy
//
//  Created by Whitney Lauren on 6/15/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    var myName: String?
    
    var chatMessages: [String:[String:AnyObject]] = [:]
    
    
    
    @IBOutlet weak var chatField: UITextField!
    
    @IBOutlet weak var nameButton: UIButton!
    
    
    @IBOutlet weak var messageButton: UIButton!
    
    
    @IBOutlet weak var messagesTableView: UITableView!
    
    
    
    
    var myFireBase = Firebase(url:"https://secret-room.firebaseio.com")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messagesTableView.dataSource = self
        messagesTableView.delegate = self
        
        // Read data and react to changes
        myFireBase.observeEventType(.Value, withBlock: {
            snapshot in
            
            if let data = snapshot.value as? [String:AnyObject] {
                
                self.chatMessages = data["messages"] as! [String:[String:AnyObject]]
                
                self.messagesTableView.reloadData()
            }
            
        })
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return chatMessages.values.array.count
        
    }
    
    func tableView(tableView:UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
    
    let cell = tableView.dequeueReusableCellWithIdentifier("messageCell") as! UITableViewCell
        
    
    let message = chatMessages.values.array[indexPath.row]
        
    cell.textLabel?.text = message["name"] as? String
    cell.detailTextLabel?.text = message["message"] as? String

    
    return cell
    
}

    


@IBAction func saveName(sender: AnyObject)
    
{
    
    
    myName = chatField.text
    
    nameButton.hidden = false
    messageButton.hidden = false
    
    chatField.text = ""
    
}


@IBAction func sendMessage(sender: AnyObject)
{
    
    let firebaseMessages = myFireBase.childByAppendingPath("messages")
    
    let firebaseMessage = firebaseMessages.childByAutoId()
    
    let message = [
        
        "message" : chatField.text,
        "name" : myName
        
        
    ]
    
    chatField.text = ""
    
    firebaseMessage.setValue(message)
    
    
}




override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}


}

