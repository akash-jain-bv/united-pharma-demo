//
//  WishlistViewModel.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 13/10/23.
//

import Foundation
//MARK: - WishlistObject
class WishlistObject{
    
    var wishlistDataArray : [WishlistData] = []
    
    func wishlistObject() -> [WishlistData]{
        wishlistDataArray.append(WishlistData(productName: "Oralite 28 Gm 10 Sachets", productPrice: "6.95SAR", quantity: "1", inStock: false, productImage: "wishlist1", productOffer: ""))
        wishlistDataArray.append(WishlistData(productName: "Eucerin Foot Cream", productPrice: "52.90SAR", quantity: "4", inStock: true, productImage: "wishlist2", productOffer: "50% off"))
        wishlistDataArray.append(WishlistData(productName: "Tylenol 200Mg", productPrice: "11.40SAR", quantity: "1", inStock: true, productImage: "wishlist3", productOffer: ""))
        wishlistDataArray.append(WishlistData(productName: "Uriage Deo Roll 50Ml", productPrice: "77.05SAR", quantity: "1", inStock: true, productImage: "wishlist4", productOffer: "Buy 2 Get 2 Free"))
        wishlistDataArray.append(WishlistData(productName: "Oralite 28 Gm 10 Sachets", productPrice: "6.95SAR", quantity: "1", inStock: false, productImage: "wishlist1", productOffer: ""))
        wishlistDataArray.append(WishlistData(productName: "Eucerin Foot Cream", productPrice: "52.90SAR", quantity: "4", inStock: true, productImage: "wishlist2", productOffer: "50% off"))
        wishlistDataArray.append(WishlistData(productName: "Tylenol 200Mg", productPrice: "11.40SAR", quantity: "1", inStock: true, productImage: "wishlist3", productOffer: ""))
        wishlistDataArray.append(WishlistData(productName: "Uriage Deo Roll 50Ml", productPrice: "77.05SAR", quantity: "1", inStock: true, productImage: "wishlist4", productOffer: "Buy 2 Get 2 Free"))
        return wishlistDataArray
    }
}
