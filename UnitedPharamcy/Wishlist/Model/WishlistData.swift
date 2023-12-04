//
//  WishlistData.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 05/10/23.
//

import Foundation
//MARK: - WishlistData
class WishlistData{
    
    var productName : String
    var productPrice : String
    var quantity : String
    var inStock : Bool
    var productImage : String
    var productOffer : String
    
    init(productName : String,productPrice : String,quantity : String,inStock : Bool,productImage : String,productOffer : String) {
        self.productName = productName
        self.productPrice = productPrice
        self.quantity = quantity
        self.inStock = inStock
        self.productImage = productImage
        self.productOffer = productOffer
    }
}
