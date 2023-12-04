//
//  CartModel.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 22/09/23.
//

import Foundation
//MARK: - CartCellsRegistration
enum CartCellsRegistration{
    case deliveryOptionCell
    case productCell
    case couponCell
    case orderSummaryCell
}
//MARK: - CartProductDetails
class CartProductDetails{
    var cellName : CartCellsRegistration
    var productName : String
    var productPrice : String
    var quantity : Int
    var subtotal : String
    var productImage : String
    var placeholder : String
    var tax : String
    var orderTotal : String
    
    init(productName : String,productPrice : String,quantity : Int,subtotal : String,productImage : String,placeholder : String,tax : String,orderTotal : String,cellName : CartCellsRegistration) {
        self.productName = productName
        self.productPrice = productPrice
        self.quantity = quantity
        self.subtotal = subtotal
        self.productImage = productImage
        self.placeholder = placeholder
        self.tax = tax
        self.orderTotal = orderTotal
        self.cellName = cellName
    }
}
//MARK: - NumberOfQty
class NumberOfQty{
    var number : String
    
    init(number : String) {
        self.number = number
    }
}

class CalenderTime{
    var dayName : String
    var dateName : String
    
    init(dayName : String,dateName : String) {
        self.dayName = dayName
        self.dateName = dateName
    }
}
