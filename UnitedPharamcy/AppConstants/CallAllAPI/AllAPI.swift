//
//  AllAPI.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 03/11/23.
//

import Foundation

enum APIService{
    case homePage
    case categoriesPage
    case categoriedDrop
    case offerPage
    case offerSelect
    
    func getAPI(id : Int?) -> String{
        switch self {
        case .homePage:
            return "https://test2.unitedpharmacy.sa/mobikulhttp/catalog/homepagedata?eTag=&websiteId=1&storeId=1&quoteId=0&customerToken=&currency=SAR&width=1080&mFactor=2.625&isFromUrl=0&url=&is_home_brands=1"
        case .categoriesPage:
           return "https://test2.unitedpharmacy.sa/mobikulhttp/catalog/getparentcategories?storeId=1"
        case .categoriedDrop:
            return "https://test2.unitedpharmacy.sa/mobikulhttp/catalog/getchildcategories?storeId=1&categoryId=\(id ?? 0)"
        case .offerPage:
           return "https://test2.unitedpharmacy.sa/mobikulhttp/catalog/getSpecialOffersList?storeId=1&quoteId=576866&currency=SAR&customerToken=&websiteId=1&width=1080.000000"
        case .offerSelect:
            return "https://test2.unitedpharmacy.sa/mobikulhttp/catalog/getSpecialOffersDetail?storeId=2&offerId=\(id ?? 0)"
            
        }
    }
}
