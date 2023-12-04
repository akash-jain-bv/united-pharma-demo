//
//  ProfileViewModel.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 13/10/23.
//

import Foundation
//MARK: - ProfileObject
class ProfileObject{
    var profileDataArray : [ProfileData] = []
    var ordersDataArray : [Orders] = []
    
    func profileNotLoggedInObject() -> [ProfileData]{
        profileDataArray.append(ProfileData(labelName: "Sign In", labelImage: "sign_ic"))
        profileDataArray.append(ProfileData(labelName: "Orders And Returns", labelImage: "return_ic"))
        return profileDataArray
    }
    
    func profileLoggedInObject() -> [ProfileData]{
        profileDataArray.append(ProfileData(labelName: "Dashboard", labelImage: "sign_ic"))
        profileDataArray.append(ProfileData(labelName: "Orders", labelImage: "orders_ic"))
        profileDataArray.append(ProfileData(labelName: "Address Book", labelImage: "AB_ic"))
        profileDataArray.append(ProfileData(labelName: "Account Information", labelImage: "AC_ic"))
        profileDataArray.append(ProfileData(labelName: "Gift Cards", labelImage: "gift_ic"))
        return profileDataArray
    }
    
    func ordersObject() -> [Orders]{
        ordersDataArray.append(Orders(tfPlaceholder: "Order ID", tcText: "Order ID"))
        ordersDataArray.append(Orders(tfPlaceholder: "Billing Last Name", tcText: "Billing Last Name"))
        ordersDataArray.append(Orders(tfPlaceholder: "Find Order By", tcText: "Find Order By"))
        ordersDataArray.append(Orders(tfPlaceholder: "Email Address", tcText: "Email Address"))
        return ordersDataArray
    }
}
