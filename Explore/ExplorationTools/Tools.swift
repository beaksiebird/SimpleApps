//
//  Tools.swift
//  Explore
//
//  Created by Whitney Lauren on 7/8/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit

private let _allTools = Tools()

public class Tools: NSObject {
    
public class func allTools() -> Tools { return _allTools }
    
    var name = "Beaksie"
    
    func getName() -> String {
        
        return name
        
        
    }
    

    
    
}
