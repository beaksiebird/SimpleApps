//
//  ViewController.swift
//  Money
//
//  Created by Whitney Lauren on 7/2/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit
import iAd

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bannerView = ADBannerView()
        
        //puts iAd at bottom of screen
        bannerView.frame.origin.y = view.frame.height - bannerView.frame.height
    
        view.addSubview(bannerView)
        
        
        
    }

}

