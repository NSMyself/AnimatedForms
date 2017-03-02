//
//  FormViewModel.swift
//  MVVM
//
//  Created by João Pereira on 13/02/17.
//  Copyright © 2017 NSMyself. All rights reserved.
//

import Foundation

struct FormViewModel {

    let login = [Field.picture]
    let registration = [Field.input, Field.password, Field.picture]
    var forms:FormManager
    
    init() {
        forms = FormManager(components: [login, registration])
    }
    
    func activeForm() -> [Field] {
        return forms.active()
    }
    
    func reuseIdentifiers() -> [String] {
        return forms.components.reduce([], +).map { $0.rawValue }
    }
    
    mutating func swap(step i:Int) -> ([IndexPath], [IndexPath]) {
    
        let currentlyActive = forms.active()
        forms.next(step: i)
        
        let diff = currentlyActive.diff(forms.active())
        
        let added = diff.addedIndexes.map { IndexPath(row: $0, section: 0) }
        let removed = diff.removedIndexes.map { IndexPath(row: $0, section: 0) }
        
        return (added, removed)
        
    }
}
