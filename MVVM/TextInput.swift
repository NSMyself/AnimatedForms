//
//  TextInput.swift
//  MVVM
//
//  Created by João Pereira on 15/03/17.
//  Copyright © 2017 NSMyself. All rights reserved.
//

import Foundation

struct TextInput:Field {
    
    var content:String = ""
    
    internal func value<T>() -> T {
        return content as! T
    }
}
