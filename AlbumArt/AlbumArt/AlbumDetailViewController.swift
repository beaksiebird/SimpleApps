//
//  ViewController.swift
//  AlbumArt
//
//  Created by Whitney Lauren on 5/29/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit
import AFNetworking
import AVFoundation

class AlbumDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, TrackTableViewCellDelegate {

    
    var albumInfo: [String:AnyObject]!
    
    @IBOutlet weak var tracksTableView: UITableView!
    
    @IBOutlet weak var albumName: UILabel!
    
    @IBOutlet weak var artistName: UILabel!
    
    var player: AVAudioPlayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        tracksTableView.delegate = self
        tracksTableView.dataSource = self
        
        albumName.text = albumInfo["collectionName"] as? String
        artistName.text = albumInfo["artistName"] as? String
        
        println(albumInfo)
        
        if  let albumID = albumInfo["collectionId"] as? Int {
            
            var requestManager = AFHTTPRequestOperationManager()
            
            requestManager.GET(itunesLookupAPI + "?entity=song&id=\(albumID)", parameters: nil, success: { (request, data) -> Void in
                
                let info = data as! [String:AnyObject]
                
                self.tracks = info["results"] as! [[String:AnyObject]]
                self.tracks.removeAtIndex(0)
                
                self.tracksTableView.reloadData()
                
                }) { (request, error) -> Void in
                    
                    println(error)
                    
            }
            
        }
        
        
        
    }
    
    var tracks: [[String:AnyObject]] = []
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("trackCell", forIndexPath: indexPath) as! TrackTableViewCell
        
        cell.trackInfo = tracks[indexPath.row]
        
        cell.delegate = self
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tracks.count
        
    }
    
    func playSongWithURL(url: String) {
        
        player?.stop()
        
        if let url = NSURL(string: url) {
            
            if let trackData = NSData(contentsOfURL: url) {
                
                player = AVAudioPlayer(data: trackData, error: nil)
                
                player?.play()
                
                println("pressed")
            }
            
        }
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        player?.stop()
        
    }
    
}
        

    




