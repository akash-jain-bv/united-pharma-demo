//
//  CartViewModel.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 13/10/23.
//

import Foundation
//MARK: - CartObject
class CartObject{
    //MARK: - Variables
    static let shared = CartObject()
    private init(){}
    var productArray : [CartProductDetails] = []
    var numberArray : [NumberOfQty] = []
    var calenderArray : [CalenderTime] = []
    
    func subtotal(quantity : Int,price : Int) -> String{
        return "Subtotal: \(quantity * price)"
    }
    
    func numberObject() -> [NumberOfQty]{
        for num in 1...10{
            numberArray.append(NumberOfQty(number: "\(num)"))
        }
        return numberArray
    }
    
    func productDetailsObject() -> [CartProductDetails]{
        productArray.append(CartProductDetails(productName: "", productPrice: "", quantity: 0, subtotal: "", productImage: "", placeholder: "", tax: "", orderTotal: "", cellName: .deliveryOptionCell))
        productArray.append(CartProductDetails(productName: "MUSTELA BABY VITAMIN BARRIER CREAM 50ML", productPrice: "46.00SAR", quantity: 1, subtotal:"Subtotal: 46.00SAR" , productImage: "Image 26", placeholder: "",tax: "",orderTotal: "", cellName: .productCell))
        productArray.append(CartProductDetails(productName: "MUSTELA BABY VITAMIN BARRIER CREAM 50ML", productPrice: "46.00SAR", quantity: 1, subtotal: "Subtotal: 46.00SAR", productImage: "Image 20", placeholder: "",tax: "",orderTotal: "", cellName: .productCell))
        productArray.append(CartProductDetails(productName: "", productPrice: "", quantity: 0, subtotal: "", productImage: "", placeholder: "Enter Discount Code",tax: "",orderTotal: "", cellName: .couponCell))
        productArray.append((CartProductDetails(productName: "", productPrice: "", quantity: 0, subtotal: "103.50 SAR", productImage: "", placeholder: "", tax: "13.50 SAR", orderTotal: "103.50 SAR", cellName: .orderSummaryCell)))
        return productArray
    }
    func calenderObject() -> [CalenderTime]{
        calenderArray.append(CalenderTime(dayName: "Today", dateName: "21 Jul"))
        calenderArray.append(CalenderTime(dayName: "Tom", dateName: "22 Jul"))
        calenderArray.append(CalenderTime(dayName: "Fri", dateName: "23 Jul"))
        calenderArray.append(CalenderTime(dayName: "Sat", dateName: "24 Jul"))
        calenderArray.append(CalenderTime(dayName: "Sun", dateName: "25 Jul"))
        calenderArray.append(CalenderTime(dayName: "Mon", dateName: "26 Jul"))
        calenderArray.append(CalenderTime(dayName: "Tue", dateName: "27 Jul"))
        return calenderArray
    }
}
