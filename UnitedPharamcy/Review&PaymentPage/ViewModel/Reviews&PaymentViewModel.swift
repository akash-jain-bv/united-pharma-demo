//
//  Reviews&PaymentViewModel.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 13/10/23.
//

import Foundation
//MARK: - ReviewAndPaymentObject
class ReviewAndPaymentObject{
    //MARK: - Variables
    var reviewAndPaymentArray : [ReviewAndPaymentData] = []
    
    func reviewAndPaymentObject() -> [ReviewAndPaymentData]{
        reviewAndPaymentArray.append(ReviewAndPaymentData(address: "", cellName: .couponCell, productName: "", productPrice: "", quantity: 0, subtotal: "", productImage: "", tax: "", shippingCharge: "", orderTotal: ""))
        reviewAndPaymentArray.append(ReviewAndPaymentData(address: "", cellName: .orderCell, productName: "", productPrice: "", quantity: 0, subtotal: "103.50 SAR", productImage: "", tax: "13.50 SAR", shippingCharge: "16.00 SAR", orderTotal: "103.50 SAR"))
        return reviewAndPaymentArray
    }
}
