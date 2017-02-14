//
//  Field.swift
//  MVVM
//
//  Created by João Pereira on 31/01/17.
//  Copyright © 2017 NSMyself. All rights reserved.
//

import UIKit

struct Field:Equatable {
    
    let rawValue:String
    
    static let picture = Field(rawValue: "PictureCell")
    static let input = Field(rawValue: "InputCell")
    static let password = Field(rawValue: "PasswordCell")
}

func == (lhs: Field, rhs: Field) -> Bool {
    return lhs.rawValue == rhs.rawValue
}
