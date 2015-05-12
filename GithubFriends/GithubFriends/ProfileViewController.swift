//
//  ProfileViewController.swift
//  GithubFriends
//
//  Created by Whitney Lauren on 5/12/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    var userProfile: String!
    
    @IBOutlet weak var ProfileWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userProfile = lastUserCreated
        
        let url = NSURL(string: "https://api.github.com/users/\(userProfile)?client_id=18c2e67eaf44f4a60b76&client_secret=5528dd41089fd0a5de62e7927b849075b65463a0")
            
            let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {
                (data, response, error) in
                
                // if there is no error
                if error == nil {
                    
                    var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding)
                    
                    println(urlContent)
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        
                        self.ProfileWebView.loadHTMLString(urlContent! as String, baseURL: nil)
                        
                    }
                    
                }
                
            }
            
            task.resume()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
