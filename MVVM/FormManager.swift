//
//  FormManager.swift
//  MVVM
//
//  Created by João Pereira on 14/02/17.
//  Copyright © 2017 NSMyself. All rights reserved.
//

import Foundation

struct FormManager {
    let components:[[Field]]
    var currentlyActive = -1
    
    init(components:[[Field]]) {
        if components.count > 0 {
            self.currentlyActive = 0
        }
        
        self.components = components
    }
    
    func active() -> [Field] {
        guard currentlyActive > -1 else {
            fatalError("No forms at all are present")
        }
        
        return components[currentlyActive]
    }
    
    mutating func next(step: Int) {
        currentlyActive = (currentlyActive + step) % components.count
    }
}
