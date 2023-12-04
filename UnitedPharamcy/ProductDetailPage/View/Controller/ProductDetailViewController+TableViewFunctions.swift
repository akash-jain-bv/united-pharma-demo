//
//  ProductDetailViewController+TableViewFunctions.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 31/10/23.
//

import UIKit
//MARK: - TableView Functions
extension ProductDetailViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch dataArray[indexPath.row].cellName{
        case "imageCell":
            let productImageCell = tableView.dequeueReusableCell(withIdentifier: "productImageCell", for: indexPath) as! CustomProductImageCell
            if let prodImage = aboutProduct["prodImage"]{
                [productImageCell.setUpImageData(data: prodImage)]
            }
            return productImageCell
        case "productCell":
            let aboutProductCell = tableView.dequeueReusableCell(withIdentifier: "aboutProductCell", for: indexPath) as! CustomAboutProductCell
            if let prodName = aboutProduct["prodName"],let prodPrice = aboutProduct["prodPrice"]{
                aboutProductCell.productName.text = prodName
                aboutProductCell.productPrice.text = prodPrice
            }
            return aboutProductCell
        case "wishlistShareCell":
            let productFunctionCell = tableView.dequeueReusableCell(withIdentifier: "productFunctionCell", for: indexPath) as! CustomProductFunctionCell
            return productFunctionCell
        case "detailsCell":
            let detailsCell = tableView.dequeueReusableCell(withIdentifier: "detailsCell", for: indexPath) as! CustomProductDetailsCell
            return detailsCell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch dataArray[indexPath.row].cellName{
        case "imageCell":
            return 400
        case "productCell":
            return 100
        case "wishlistShareCell":
            return 120
        case "detailsCell":
            return 150
        default:
            return UITableView.automaticDimension
        }
    }
}
