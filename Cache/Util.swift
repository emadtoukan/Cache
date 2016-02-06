//
//  Util.swift
//  Cache
//
//  Created by Emad Toukan on 2016-02-06.
//  Copyright © 2016 Cache.io. All rights reserved.
//

import Foundation

struct Util {
    
    
    static func removeSpacesFromString(string: String) -> String {
        var newString = String()
        for char in string.characters where char != " "{
            newString.append(char)
        }
        return newString
    }
    
}