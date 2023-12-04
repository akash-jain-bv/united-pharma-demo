//
//  CategoriesModel.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 11/10/23.
//

import Foundation
//MARK: - CategoriesSectionCell
enum CategoriesSectionCell : Int{
    case slideLabelCell = 0
    case bannerCell
    case bannerCellTwo
}
// MARK: - CategoriesData
struct CategoriesData: Codable {
    let success: Bool?
    let message: String?
    let banners: [CategoryBanner]?
    let categoryData: [CategoryDatum]?
}
// MARK: - Banner
struct CategoryBanner: Codable {
    let id: String?
    let image: String?
    let redirectType: String?
    let redirectRef: String?
    let url: String?
    let competitionID: String?

    enum CodingKeys: String, CodingKey {
        case id, image
        case redirectType = "redirect_type"
        case redirectRef = "redirect_ref"
        case url
        case competitionID = "competition_id"
    }
}
// MARK: - CategoryDatum
struct CategoryDatum: Codable {
    let id, name: String?
    let hasChildren: Bool?
    let bigMobileImage: String?
    let mediumMobileImage: String?
    let smallMobileImage: String?
    let childCategories: [CategoryDatum]?

    enum CodingKeys: String, CodingKey {
        case id, name, hasChildren
        case bigMobileImage = "big_mobile_image"
        case mediumMobileImage = "medium_mobile_image"
        case smallMobileImage = "small_mobile_image"
        case childCategories
    }
}
// MARK: - CategoriesDropDown
struct CategoriesDropDown: Codable {
    let success: Bool?
    let message: String?
    let categories: [CategoryDrop]?
}
// MARK: - Category
struct CategoryDrop: Codable {
    let id, name: String?
    let hasChildren: Bool?
    let bigMobileImage: String?
    let mediumMobileImage: String?
    let smallMobileImage: String?
    let childCategories: [CategoryDrop]?

    enum CodingKeys: String, CodingKey {
        case id, name, hasChildren
        case bigMobileImage = "big_mobile_image"
        case mediumMobileImage = "medium_mobile_image"
        case smallMobileImage = "small_mobile_image"
        case childCategories
    }
}
