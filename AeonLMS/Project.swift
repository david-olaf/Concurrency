//
//  Project.swift
//  AeonLMS
//
//  Created by son on 9/20/16.
//  Copyright © 2016 David. All rights reserved.
//

import Foundation

class Project {
    
    public var projectId: String
    public var title: String
    public var startp: String
    public var start1: String
    public var start2: String
    public var start3: String
    public var endp: String
    public var end1: String
    public var end2: String
    public var end3: String
    
    init() {
        
        projectId = ""
        title = ""
        startp = ""
        start1 = ""
        start2 = ""
        start3 = ""
        endp = ""
        end1 = ""
        end2 = ""
        end3 = ""
    }
    
    init(object: AnyObject) {
        
        projectId = object["projectid"] as! String
        title = object["title"] as! String
        startp = object["startp"] as! String
        start1 = object["start1"] as! String
        start2 = object["start2"] as! String
        start3 = object["start3"] as! String
        endp = object["endp"] as! String
        end1 = object["end1"] as! String
        end2 = object["end2"] as! String
        end3 = object["end3"] as! String
    }
}
