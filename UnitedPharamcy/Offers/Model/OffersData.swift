//
//  OffersData.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 03/10/23.
//

import Foundation
//MARK: - offersCellRegistration
enum offersCellRegistration : Int,CaseIterable{
    case storiesCell = 0
    case slideLabelCell
    case productCell
}
//MARK: - DisplayStoryData
class DisplayStoryData{
    var displayImage : String
    
    init(displayImage : String) {
        self.displayImage = displayImage
    }
}
// MARK: - Offers
struct Offers: Codable {
    let success: Bool?
    let message: String?
    let specialofferes: [Specialoffere]?
}
// MARK: - Specialoffere
struct Specialoffere: Codable {
    let id, offerName, offerTitle, isBestoffer: String?
    let bannerImageurl: String?
    let status: String?
    let banners: [Banner]?
    let productList: [ProductList]?

    enum CodingKeys: String, CodingKey {
        case id, offerName, offerTitle
        case isBestoffer = "is_bestoffer"
        case bannerImageurl
        case status, productList, banners
    }
}

