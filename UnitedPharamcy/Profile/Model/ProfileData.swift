//
//  ProfileData.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 04/10/23.
//

import Foundation

//MARK: - ProfileData
class ProfileData{
    var labelName : String
    var labelImage : String
    
    init(labelName : String,labelImage : String) {
        self.labelName = labelName
        self.labelImage = labelImage
    }
}
//MARK: - Orders
class Orders{
    var tfPlaceholder : String
    var tcText : String
    
    init(tfPlaceholder : String,tcText : String) {
        self.tfPlaceholder = tfPlaceholder
        self.tcText = tcText
    }
}
