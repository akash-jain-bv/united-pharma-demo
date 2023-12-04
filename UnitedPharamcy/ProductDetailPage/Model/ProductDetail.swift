//
//  ProductDetail.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 25/09/23.
//

import Foundation
//MARK: - ProductDetail
class ProductDetail{
    var productImage : String
    var productName : String
    var productPrice : String
    var isInStock : Bool
    var cellName : String
    var detail : String
    
    init(productImage : String,productName : String,productPrice : String,isInStock : Bool,cellName : String,detail : String) {
        self.productImage = productImage
        self.productName = productName
        self.productPrice = productPrice
        self.isInStock = isInStock
        self.cellName = cellName
        self.detail = detail
    }
}
