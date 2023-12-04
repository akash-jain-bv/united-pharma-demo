//
//  SideMenuModel.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 21/09/23.
//

import Foundation

//MARK: - SideMenu
class SideMenu{
    
    var icon : String
    var labelDescription : String
    
    init(icon : String, labelDescription : String) {
        self.icon = icon
        self.labelDescription = labelDescription
    }
}

//MARK: - DropDown
class DropDown{
    var description : String
    
    init(description : String) {
        self.description = description
    }
}
