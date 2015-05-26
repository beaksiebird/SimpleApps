//
//  FriendsTableViewController.swift
//  GithubFriends
//
//  Created by Whitney Lauren on 5/12/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit

var lastUserCreated: String!

class FriendsTableViewController: UITableViewController {
    
    
    @IBOutlet weak var friendNameField: UITextField!
    
    var friends: [[String:AnyObject?]] = [
        
        
        [
            
            "login": "whitneyhogg",
            "id": 10519817,
            "avatar_url": "https://avatars.githubusercontent.com/u/10519817?v=3",
            "gravatar_id": "",
            "url": "https://api.github.com/users/whitneyhogg",
            "html_url": "https://github.com/whitneyhogg",
            "followers_url": "https://api.github.com/users/whitneyhogg/followers",
            "following_url": "https://api.github.com/users/whitneyhogg/following{/other_user}",
            "gists_url": "https://api.github.com/users/whitneyhogg/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/whitneyhogg/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/whitneyhogg/subscriptions",
            "organizations_url": "https://api.github.com/users/whitneyhogg/orgs",
            "repos_url": "https://api.github.com/users/whitneyhogg/repos",
            "events_url": "https://api.github.com/users/whitneyhogg/events{/privacy}",
            "received_events_url": "https://api.github.com/users/whitneyhogg/received_events",
            "type": "User",
            "site_admin": false,
            "name": "Whitney Hogg",
            "company": "",
            "blog": "",
            "location": "Marietta, GA",
            "email": "whitneylaurenhogg@gmail.com",
            "hireable": false,
            "bio": nil,
            "public_repos": 2,
            "public_gists": 0,
            "followers": 8,
            "following": 9,
            "created_at": "2015-01-13T18:30:19Z",
            "updated_at": "2015-05-12T12:24:20Z"
        ]
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    @IBAction func addFriend(sender: AnyObject) {
        
        //'https://api.github.com/users/whatever?client_id=xxxx&client_secret=yyyy'
        
        let endpoint = "https://api.github.com/users/\(friendNameField.text)?client_id=18c2e67eaf44f4a60b76&client_secret=5528dd41089fd0a5de62e7927b849075b65463a0"
        
        
        if let friendInfo = GithubRequest.getInfoWithEndpoint(endpoint) as? [String:AnyObject] {
            
            
            
            
            println(endpoint)
            
            lastUserCreated = friendNameField.text
            
            tableView.reloadData()
            
            friends.insert(friendInfo, atIndex: 0)
        }
        
        
        
        
        friendNameField.text = ""
        
        
        
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    //    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    //        // #warning Potentially incomplete method implementation.
    //        // Return the number of sections.
    //        return 0
    // }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return friends.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("friendCell", forIndexPath: indexPath) as! FriendTableViewCell
        
        
        cell.friendIndex = indexPath.row
        cell.friendInfo = friends[indexPath.row]
        
        
        // Configure the cell...
        
        return cell
    }
    
    
    //Override to support conditional editing of the table view.
    
    // override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    
    //       return true
    //}
    
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            
            friends.removeAtIndex(indexPath.row)
            
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
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "repoSegue" {
            
            var reposTVC = segue.destinationViewController as! ReposTableViewController
            
            
            var reposButton = sender as! UIButton
            
            
            reposTVC.friendInfo = friends[reposButton.tag]
            
        }
        
        
        
        
        
        
        
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    
}



