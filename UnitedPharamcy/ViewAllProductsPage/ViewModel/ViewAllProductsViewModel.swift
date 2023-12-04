//
//  ViewAllProductsViewModel.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 13/10/23.
//

import Foundation
//MARK: - ViewAllProductsObject
class ViewAllProductsObject{
    static let shared  = ViewAllProductsObject()
    
    var iconCollectionArray : [IconCollection] = []
    var allProductArray : [AllProductData] = []
    
    func iconCollectionObject() -> [IconCollection]{
        iconCollectionArray.append(IconCollection(name: " SORT", imageName: "sort24"))
        iconCollectionArray.append(IconCollection(name: " FILTER", imageName: "filter24"))
        iconCollectionArray.append(IconCollection(name: " GRID", imageName: "Group 9942"))
        return iconCollectionArray
    }
    
    func allProductObject() -> [AllProductData]{
        allProductArray.append(AllProductData(imageName: "Mask Group 14", prodDescription: "Baby Joy Size 5 Large, 14-25 Kg Jumb ...", prodPrice: "165.00SAR", prodFreeStatus: "2 + 1  Free"))
        allProductArray.append(AllProductData(imageName: "Mask Group 14", prodDescription: "Baby Joy Size 5 Large, 14-25 Kg Jumb ...", prodPrice: "165.00SAR", prodFreeStatus: "2 + 1  Free"))
        allProductArray.append(AllProductData(imageName: "Mask Group 14", prodDescription: "Baby Joy Size 5 Large, 14-25 Kg Jumb ...", prodPrice: "165.00SAR", prodFreeStatus: "2 + 1  Free"))
        allProductArray.append(AllProductData(imageName: "Mask Group 14", prodDescription: "Baby Joy Size 5 Large, 14-25 Kg Jumb ...", prodPrice: "165.00SAR", prodFreeStatus: "2 + 1  Free"))
        allProductArray.append(AllProductData(imageName: "Mask Group 14", prodDescription: "Baby Joy Size 5 Large, 14-25 Kg Jumb ...", prodPrice: "165.00SAR", prodFreeStatus: "2 + 1  Free"))
        allProductArray.append(AllProductData(imageName: "Mask Group 14", prodDescription: "Baby Joy Size 5 Large, 14-25 Kg Jumb ...", prodPrice: "165.00SAR", prodFreeStatus: "2 + 1  Free"))
        allProductArray.append(AllProductData(imageName: "Mask Group 14", prodDescription: "Baby Joy Size 5 Large, 14-25 Kg Jumb ...", prodPrice: "165.00SAR", prodFreeStatus: "2 + 1  Free"))
        allProductArray.append(AllProductData(imageName: "Mask Group 14", prodDescription: "Baby Joy Size 5 Large, 14-25 Kg Jumb ...", prodPrice: "165.00SAR", prodFreeStatus: "2 + 1  Free"))
        allProductArray.append(AllProductData(imageName: "Mask Group 14", prodDescription: "Baby Joy Size 5 Large, 14-25 Kg Jumb ...", prodPrice: "165.00SAR", prodFreeStatus: "2 + 1  Free"))
        allProductArray.append(AllProductData(imageName: "Mask Group 14", prodDescription: "Baby Joy Size 5 Large, 14-25 Kg Jumb ...", prodPrice: "165.00SAR", prodFreeStatus: "2 + 1  Free"))
        allProductArray.append(AllProductData(imageName: "Mask Group 14", prodDescription: "Baby Joy Size 5 Large, 14-25 Kg Jumb ...", prodPrice: "165.00SAR", prodFreeStatus: "2 + 1  Free"))
        allProductArray.append(AllProductData(imageName: "Mask Group 14", prodDescription: "Baby Joy Size 5 Large, 14-25 Kg Jumb ...", prodPrice: "165.00SAR", prodFreeStatus: "2 + 1  Free"))
        return allProductArray
    }
    
    func sortObject() -> [SortBy]{
        return [
            SortBy(sortType: "Product Name A to Z"),
            SortBy(sortType: "Product Name Z to A"),
            SortBy(sortType: "Price Low to High"),
            SortBy(sortType: "Price High to Low"),
            SortBy(sortType: "Offer Low to High"),
            SortBy(sortType: "Offer High to Low")
        ]
    }
}
