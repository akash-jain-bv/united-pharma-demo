//
//  ChangeStoreViewModel.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 20/10/23.
//

import Foundation
//MARK: - StoreObject
class StoreObject{
    static let shared = StoreObject()
    private init(){}
    
    func storeAddressObject() -> [StoreAddress]{
        return [StoreAddress(storeName: "Store Name", storeAddress: "1 Sheikh Mohammed bin Rashid Blvd - Downtown Dubai - Dubai - United Arab Emirates"),StoreAddress(storeName: "Store Name", storeAddress: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sagittis justo quis nunc lacinia eleifend."),StoreAddress(storeName: "Store Name", storeAddress: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sagittis justo quis nunc lacinia eleifend."),StoreAddress(storeName: "Store Name", storeAddress: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sagittis justo quis nunc lacinia eleifend."),StoreAddress(storeName: "Store Name", storeAddress: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sagittis justo quis nunc lacinia eleifend."),StoreAddress(storeName: "Store Name", storeAddress: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sagittis justo quis nunc lacinia eleifend.")]
    }
}
