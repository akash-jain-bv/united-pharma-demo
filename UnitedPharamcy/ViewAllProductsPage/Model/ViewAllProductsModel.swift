//
//  ViewAllProductsModel.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 26/09/23.
//

import Foundation
//MARK: - IconCollection
class IconCollection{
    
    var name: String
    var imageName : String
    
    init(name: String, imageName : String) {
        self.name = name
        self.imageName = imageName
    }
}
//MARK: - AllProductData
class AllProductData{
    
    var imageName : String
    var prodDescription : String
    var prodPrice : String
    var prodFreeStatus : String
    
    init(imageName : String,prodDescription : String,prodPrice : String,prodFreeStatus : String) {
        self.imageName = imageName
        self.prodDescription = prodDescription
        self.prodPrice = prodPrice
        self.prodFreeStatus = prodFreeStatus
    }
}

struct SortBy{
    var sortType : String
}
