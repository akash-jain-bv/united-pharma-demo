//
//  ReviewAndPaymentModel.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 25/09/23.
//

import Foundation
//MARK: - CellType
enum CellType{
    case couponCell
    case orderCell
}
//MARK: - ReviewAndPaymentData
class ReviewAndPaymentData{
    var address : String
    var cellName : CellType
    var productName : String
    var productPrice : String
    var quantity : Int
    var subtotal : String
    var productImage : String
    var tax : String
    var shippingCharge : String
    var orderTotal : String
    
    init(address : String,cellName : CellType,productName : String,productPrice : String,quantity : Int,subtotal : String,productImage : String,tax : String,shippingCharge : String,orderTotal : String) {
        self.address = address
        self.cellName = cellName
        self.productName = productName
        self.productPrice = productPrice
        self.quantity = quantity
        self.subtotal = subtotal
        self.productImage = productImage
        self.tax = tax
        self.shippingCharge = shippingCharge
        self.orderTotal = orderTotal
    }
}
