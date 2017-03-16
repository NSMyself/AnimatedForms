//
//  FormViewModel.swift
//  MVVM
//
//  Created by João Pereira on 13/02/17.
//  Copyright © 2017 NSMyself. All rights reserved.
//

import Foundation

struct FormViewModel {

    static let mapper:[FieldKind:String] = [.textInput: "InputCell", .passwordInput: "PasswordCell"]
    
    let login = Form([.textInput])
    let registration = Form([.textInput, .passwordInput])
    
    var forms:[Form]
    var currentlyActive = 0
    
    init() {
        forms = [login, registration]
    }
    
    func active() -> Form {
        return forms[currentlyActive]
    }
    
    func reuseIdentifiers() -> [String] {
        
        var tmp:[[FieldKind]] = []
        
        for form in forms {
            tmp.append(form.rawFields)
        }
    
        return Array(tmp.joined()).flatMap { FormViewModel.mapper[$0] }
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
