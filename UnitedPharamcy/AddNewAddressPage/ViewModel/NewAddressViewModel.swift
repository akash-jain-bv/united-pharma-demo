//
//  NewAddressViewModel.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 19/10/23.
//

import UIKit
import GoogleMaps
//MARK: - TextFieldsObjects
class TextFieldsObjects{
    
    var addressArray : [TextFields] = []
    static let shared = TextFieldsObjects()
    private init(){}
    func addressObject() -> [TextFields]{
        return [TextFields(title: "Name*", placeholder: "Name*", fieldType: .name),TextFields(title: "Street Address*", placeholder: "Street Address*", fieldType: .streetAddress),TextFields(title: "Country*", placeholder: "Country*", fieldType: .country),TextFields(title: "City*", placeholder: "City*", fieldType: .city),TextFields(title: "District*", placeholder: "District*", fieldType: .district),TextFields(title: "Mobile*", placeholder: "Mobile*", fieldType: .mobile)]
    }
    func checkAuthorisation(status : CLAuthorizationStatus){
        switch status {
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
        case .denied:
            print("denied")
        case .notDetermined:
            print("Not Deteremined")
        case .restricted:
            print("restricted")
        case .authorizedAlways:
            print("authorizedAlways")
        default:
            return
        }
    }
}
