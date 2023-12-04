//
//  DeliveryViewModel.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 19/10/23.
//

import Foundation
//MARK: - AddressObject
class AddressObject{
    static let shared = AddressObject()
    var addressArray : [DeliveryAddress] = []
    private init(){}
    
    func addressObject() -> [DeliveryAddress]{
        return [DeliveryAddress(name: "Jack Doy", address: "1 Sheikh Mohammed bin Rashid Blvd - Downtown Dubai - Dubai - United Arab Emirates"),DeliveryAddress(name: "Neha Thakur", address: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sagittis justo quis nunc lacinia eleifend."),DeliveryAddress(name: "Sanjay Vora", address: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sagittis justo quis nunc lacinia eleifend.")]
    }
}
