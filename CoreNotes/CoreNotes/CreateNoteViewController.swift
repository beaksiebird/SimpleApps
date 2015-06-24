//
//  CreateNoteViewController.swift
//  CoreNotes
//
//  Created by Whitney Lauren on 6/23/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit
import CoreData

//add a category relationship for the new note

// add tags comma separated for the new note (HARD MODE)
// add text field and button for the tag (HARD MODE)

var appDelegate: AppDelegate = {
    
    return UIApplication.sharedApplication().delegate as! AppDelegate
    
}()



class CreateNoteViewController: UIViewController {
    
    @IBOutlet weak var noteTextField: UITextField!
    
    @IBAction func createNote(sender: UIButton) {
        
        
        let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        if let moc = appDelegate.managedObjectContext {
           
            var newObject = NSEntityDescription.insertNewObjectForEntityForName("Note", inManagedObjectContext: moc) as! NSManagedObject
            
            newObject.setValue(noteTextField.text, forKey: "content")
            newObject.setValue(NSDate(), forKey: "created")
            
            // add five buttons and set category relationship
            
            appDelegate.saveContext()
            
            dismissViewControllerAnimated(true, completion: nil)
            
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
