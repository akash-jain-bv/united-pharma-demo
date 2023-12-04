//
//  OffersViewModel.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 13/10/23.
//

import Foundation
//MARK: - OffersObject
class OffersObject{
     
    static let shared = OffersObject()
    var displayStoryArray : [DisplayStoryData] = []
    
    private init(){}
    
    func displayStoryObject() -> [DisplayStoryData]{
        displayStoryArray.append(DisplayStoryData(displayImage: "story_1"))
        displayStoryArray.append(DisplayStoryData(displayImage: "story_2"))
        displayStoryArray.append(DisplayStoryData(displayImage: "story_1"))
        displayStoryArray.append(DisplayStoryData(displayImage: "story_2"))
        displayStoryArray.append(DisplayStoryData(displayImage: "story_1"))
        displayStoryArray.append(DisplayStoryData(displayImage: "story_2"))
        return displayStoryArray
    }
    
    func callOffersStoryAPI(completionHandler : @escaping ([Specialoffere])->()){
        CallAPI.shared.fetchData(pageUrl: APIService.offerPage.getAPI(id: nil), dataModel: Offers.self, completionHandler: { dataValue in
            DispatchQueue.main.async {
                if let offersData = dataValue?.specialofferes{
                    completionHandler(offersData)
                }
            }
        })
    }
    
    func callOffersData(id : Int,completionHandler : @escaping ([ProductList],[Banner])->()){
        CallAPI.shared.fetchData(pageUrl: APIService.offerSelect.getAPI(id: id), dataModel: Offers.self, completionHandler: { dataValue in
            if let offersData = dataValue?.specialofferes,let prodList = offersData[0].productList{
                completionHandler(prodList,offersData[0].banners ?? [])
            }
        })
    }
}
