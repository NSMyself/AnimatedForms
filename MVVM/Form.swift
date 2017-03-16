//
//  Form.swift
//  MVVM
//
//  Created by João Pereira on 14/03/17.
//  Copyright © 2017 NSMyself. All rights reserved.
//

import Foundation

struct Form {
    
    enum FieldKind {
        case textInput
        case passwordInput
    }
    
    static func FieldMapper(input:FieldKind) -> Field {
        switch(input) {
            case .textInput:
                return TextInput()
            case .passwordInput:
                return PasswordInput()
        }
    }
    
    let fields:[Field]
    let rawFields:[FieldKind]
    
    init(_ rawFields:[FieldKind]) {
        self.rawFields = rawFields
        self.fields = rawFields.map { return Form.FieldMapper(input: $0) }
    }
}
