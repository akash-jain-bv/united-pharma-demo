//
//  ProductDetailViewModel.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 13/10/23.
//

import Foundation
//MARK: - ProductDetailObject
class ProductDetailObject{
    
    var productDetailArray : [ProductDetail] = []
    
    func productDetailObject() -> [ProductDetail]{
        productDetailArray.append(ProductDetail(productImage: "Image 26", productName: "", productPrice: "", isInStock: false, cellName: "imageCell", detail: ""))
        productDetailArray.append(ProductDetail(productImage: "", productName: "MUSTELA BABY VITAMIN BARRIER CREAM 50ML"    , productPrice: "30.82SAR 46.00SAR", isInStock: true, cellName: "productCell", detail: ""))
        productDetailArray.append(ProductDetail(productImage: "", productName: "", productPrice: "", isInStock: false, cellName: "wishlistShareCell", detail: ""))
        productDetailArray.append(ProductDetail(productImage: "", productName: "", productPrice: "", isInStock: false, cellName: "detailsCell", detail: ""))
        return productDetailArray
    }
}
