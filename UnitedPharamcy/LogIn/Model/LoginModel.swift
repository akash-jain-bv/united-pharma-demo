//
//  LoginModel.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 09/10/23.
//

import Foundation
//MARK: - RegistrationTextFieldsName
enum RegistrationTextFieldsName : Int, CaseIterable {
    case emailTextField
    case password
    case firstLastName
    case confirmPassword
    case numberTextField
    
    func isValidInput(string: String) -> Bool{
        switch self {
        case .emailTextField:
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPred = NSPredicate(format : "SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: string)
        case .password :
            let passwordRegEx = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"
            let passwordPred = NSPredicate(format : "SELF MATCHES %@", passwordRegEx)
            return passwordPred.evaluate(with: string)
        case .firstLastName:
            let allowedCharacters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
            let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
            let typedCharacterSet = CharacterSet(charactersIn: string)
            let alphabet = allowedCharacterSet.isSuperset(of: typedCharacterSet)
            return alphabet
        case .numberTextField:
            let allowedCharacters = "1234567890"
            let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
            let typedCharacterSet = CharacterSet(charactersIn: string)
            let number = allowedCharacterSet.isSuperset(of: typedCharacterSet)
            return number
        case .confirmPassword:
            return true
        }
    }
}
