//
//  NewAddressData.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 19/10/23.
//

import Foundation
//MARK: - TextFieldRegistartion
enum TextFieldRegistartion{
    case name
    case streetAddress
    case country
    case city
    case district
    case mobile
}
//MARK: - TextFields
class TextFields{
    var title : String
    var placeholder : String
    var fieldType : TextFieldRegistartion
    
    init(title : String,placeholder : String,fieldType : TextFieldRegistartion) {
        self.title = title
        self.placeholder = placeholder
        self.fieldType = fieldType
    }
}
