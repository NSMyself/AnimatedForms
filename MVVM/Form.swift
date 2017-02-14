//
//  Form.swift
//  MVVM
//
//  Created by João Pereira on 31/01/17.
//  Copyright © 2017 NSMyself. All rights reserved.
//

import Foundation

struct Form {
    let components:[Field]
    
    func has(field:Field) -> Bool {
        return components.contains(field)
    }
}
