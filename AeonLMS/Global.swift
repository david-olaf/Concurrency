//
//  Global.swift
//  AeonLMS
//
//  Created by David on 9/20/16.
//  Copyright © 2016 David. All rights reserved.
//

import Foundation

class Global {
    
    static let sharedInstance = Global()
    
    func convertStringToDictionary(text: String) -> [String:AnyObject]? {
        if let data = text.data(using: String.Encoding.utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
            } catch let error as NSError {
                print(error)
            }
        }
        return nil
    }
}
