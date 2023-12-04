//
//  HomeViewModel.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 13/10/23.
//

import Foundation


//MARK: - CellData
class CellData{
    //MARK: - Variables
    static let shared = CellData()
    private init(){}
    
    var cellSortArray : [SortOrder] = []
    var cellBrandArray : [ShopByBrand] = []
    var cellBannerArray : [Banner] = []
    var cellCategoryArray : [FeaturedCategory] = []
    var ourServices : [Banner] = []
    var topSelling : [ProductList] = []
    var mostViewed : [ProductList] = []
    var chosenForYou : [ProductList] = []
    var discount : [Banner] = []
    var discountBanner : [Banner] = []
    var slideBanner : [Banner] = []

    func getApiData(completionHandler : @escaping ([Banner],[FeaturedCategory],[Banner],[ShopByBrand],[Banner],[ProductList],[Banner],[ProductList],[Banner],[ProductList],[SortOrder])->()){
        CallAPI.shared.fetchData(pageUrl: APIService.homePage.getAPI(id: nil), dataModel: UnitedPharmacy.self, completionHandler: {[weak self] pageData in
            DispatchQueue.main.async {
                if let homeCellPosition = pageData?.sortOrder ,let homeCellData = pageData?.carousel,let homeBrandData = pageData?.shopByBrands,let homeBannerData = pageData?.bannerImages,let homeCategoriesData = pageData?.featuredCategories{
                    self?.cellSortArray = homeCellPosition
                    self?.cellBrandArray = homeBrandData
                    self?.cellBannerArray = homeBannerData
                    self?.cellCategoryArray = homeCategoriesData
                    
                    for items in 0..<homeCellData.count{
                        if let dataLabel = homeCellData[items].label{
                            switch HomePageCellData(rawValue: dataLabel){
                            case .topSellingCell:
                                if let topSellingData = homeCellData[items].productList{
                                    self?.topSelling = topSellingData
                                }
                            case .servicesCell:
                                if let ourServicesData = homeCellData[items].banners{
                                    self?.ourServices = ourServicesData
                                }
                            case .mostViewedCell:
                                if let mostViewedData = homeCellData[items].productList{
                                    self?.mostViewed = mostViewedData
                                }
                            case .chosenForYouCell:
                                if let chosenForYouData = homeCellData[items].productList{
                                    self?.chosenForYou = chosenForYouData
                                }
                            case .discountCell:
                                if let discountData = homeCellData[items].banners{
                                    self?.discount = discountData
                                }
                            case .discountBarCell:
                                if let discountBannerData = homeCellData[items].banners{
                                    self?.discountBanner = discountBannerData
                                }
                            case .slideBarCell:
                                if let slideBannerData = homeCellData[items].banners{
                                    self?.slideBanner = slideBannerData
                                }
                            default:
                               break
                            }
                        }
                    }
                }
                completionHandler(self!.cellBannerArray,self!.cellCategoryArray,self!.ourServices,self!.cellBrandArray,self!.discount,self!.topSelling,self!.discountBanner,self!.mostViewed,self!.slideBanner,self!.chosenForYou,self!.cellSortArray)
            }
        })
    }
}
