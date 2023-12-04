//
//  CategoriesViewModel.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 13/10/23.
//

import Foundation
//MARK: - APIManager
class APIManager{
    static let shared = APIManager()
    var categoriesDropDataArray : [[CategoryDatum]] = []
    var dropDownDataTblOneArray : [CategoryDrop] = []
    var dropDownDataTblTwoArray : [CategoryDrop] = []
    var tblDataArray : [String : [CategoryDrop]] = [:]
    var tblTwoDropped : Bool = false
    var tblCellID = ""
    //Variables For section One
    var currentButtonForTblOne = 0
    var clvDroppedForTblOne : Bool = false
    var apiCallForTblOne : Bool = false
    //Variables For section Two
    var currentButtonForTblTwo = 0
    var clvDroppedForTblTwo : Bool = false
    var apiCallForTblTwo : Bool = false
    private init(){}
    
    func categoriesTypeData(completionHandler : @escaping ([CategoryDatum],[CategoryBanner])->()){
        CallAPI.shared.fetchData(pageUrl: APIService.categoriesPage.getAPI(id: nil), dataModel: CategoriesData.self, completionHandler: {
            dataValue in
            DispatchQueue.main.async {
                if let categoriesJsonData = dataValue?.categoryData, let categoriesBanner = dataValue?.banners{
                    self.categoriesDropDataArray = categoriesJsonData.chunk(into: 3)
                    completionHandler(categoriesJsonData,categoriesBanner)
                }
            }
        })
    }
    
    func dropDownData(completionHandler : @escaping ([CategoryDrop])->(),id : Int){
        CallAPI.shared.fetchData(pageUrl: APIService.categoriedDrop.getAPI(id: id), dataModel: CategoriesDropDown.self, completionHandler: { catgDropDownData in
            DispatchQueue.main.async {
                if let categoriesJsonData = catgDropDownData?.categories{
                    completionHandler(categoriesJsonData)
                }
            }
        })
    }
    
    func getCLCellData(indexVal : Int,dataArray : [CategoryDrop]) -> [CategoryDrop]{
        return dataArray[indexVal / 2].childCategories ?? []
    }
    
    func getTblCellID(indexValueOne : Int,indexValueTwo :Int) -> String{
        switch categoriesDropDataArray[indexValueOne][indexValueTwo].id {
        case categoriesDropDataArray[indexValueOne][0].id:
            return categoriesDropDataArray[indexValueOne][0].id ?? ""
        case categoriesDropDataArray[indexValueOne][1].id:
            return categoriesDropDataArray[indexValueOne][1].id ?? ""
        case categoriesDropDataArray[indexValueOne][2].id:
            return categoriesDropDataArray[indexValueOne][2].id ?? ""
        default:
            return "470"
        }
    }
    func dropDownTapForFirst(btnTag : Int,completionHandler : @escaping ([CategoryDrop])->()){
        dropDownDataTblTwoArray = []
        clvDroppedForTblTwo = false
        switch clvDroppedForTblOne{
        case true:
            if currentButtonForTblOne == btnTag{
                completionHandler([])
                dropDownDataTblOneArray = []
                clvDroppedForTblOne = false
            }
            else{
                tblTwoDropped = false
                currentButtonForTblOne = btnTag
            }
        case false:
            currentButtonForTblOne = btnTag
            clvDroppedForTblOne = true
        }
        tblCellID = getTblCellID(indexValueOne: 0, indexValueTwo: btnTag - 1)
        if clvDroppedForTblOne{
            if !apiCallForTblOne && !tblDataArray.contains(where: {$0.key == tblCellID}){
                apiCallForTblOne = true
                APIManager.shared.dropDownData(completionHandler: {[weak self] catgDropDownArray in
                    self?.dropDownDataTblOneArray = catgDropDownArray
                    completionHandler(catgDropDownArray)
                    self?.tblDataArray[self!.tblCellID] = catgDropDownArray
                    self?.apiCallForTblOne = false
                }, id: Int(tblCellID) ?? 470)
            }
            else{
                dropDownDataTblOneArray = tblDataArray[tblCellID] ?? []
                completionHandler(tblDataArray[tblCellID] ?? [])
            }
        }
    }
    func dropDownTapForSecond(btnTag : Int,completionHandler : @escaping ([CategoryDrop])->()){
        dropDownDataTblOneArray = []
        clvDroppedForTblOne = false
        switch clvDroppedForTblTwo{
        case true:
            if currentButtonForTblTwo == btnTag{
                completionHandler([])
                dropDownDataTblTwoArray = []
                clvDroppedForTblTwo = false
            }
            else{
                currentButtonForTblTwo = btnTag
            }
        case false:
            currentButtonForTblTwo = btnTag
            clvDroppedForTblTwo = true
        }
        tblCellID = getTblCellID(indexValueOne: 1, indexValueTwo: btnTag - 4)
        if clvDroppedForTblTwo{
            if !apiCallForTblOne && !tblDataArray.contains(where: {$0.key == tblCellID}){
                apiCallForTblTwo = true
                APIManager.shared.dropDownData(completionHandler: {[weak self] catgDropDownArray in
                    self?.dropDownDataTblTwoArray = catgDropDownArray
                    completionHandler(catgDropDownArray)
                    self?.tblDataArray[self!.tblCellID] = catgDropDownArray
                    self?.apiCallForTblTwo = false
                }, id: Int(tblCellID) ?? 470)
            }
            else{
                dropDownDataTblTwoArray = tblDataArray[tblCellID] ?? []
                completionHandler(tblDataArray[tblCellID] ?? [])
            }
        }
    }
    
    func clData(index : Int,completionHandler : @escaping ([CategoryDrop])->()){
        if let cellID = tblDataArray[tblCellID]{
           completionHandler(getCLCellData(indexVal: index, dataArray: cellID))
        }
    }
}

//MARK: - Chunked Array
extension Array {
    func chunk(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

