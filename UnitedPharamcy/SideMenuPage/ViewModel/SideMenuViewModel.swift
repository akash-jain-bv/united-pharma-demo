//
//  SideMenuViewModel.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 17/10/23.
//

import Foundation
//MARK: - SetUpSideMenuObject
class setUpSideMenuObject{
    
    var sideMenuArray : [SideMenu] = []
    var dropDownArray : [DropDown] = []
    
    func sideMenuObject() -> [SideMenu]{
        sideMenuArray.append(SideMenu(icon: "categories", labelDescription: "Categories"))
        sideMenuArray.append(SideMenu(icon: "location", labelDescription: "Store Locations"))
        sideMenuArray.append(SideMenu(icon: "user-service-desk", labelDescription: "Our Services"))
        sideMenuArray.append(SideMenu(icon: "call-outline", labelDescription: "Contact Us"))
        sideMenuArray.append(SideMenu(icon: "question-circle", labelDescription: "FAQs"))
        sideMenuArray.append(SideMenu(icon: "term", labelDescription: "Terms & Conditions"))
        return sideMenuArray
    }
    func dropDownObject() -> [DropDown]{
        dropDownArray.append(DropDown(description: "Prescription Dispensing"))
        dropDownArray.append(DropDown(description: "Ask the Pharmacist"))
        dropDownArray.append(DropDown(description: "Doctor Consultation"))
        return dropDownArray
    }
}
