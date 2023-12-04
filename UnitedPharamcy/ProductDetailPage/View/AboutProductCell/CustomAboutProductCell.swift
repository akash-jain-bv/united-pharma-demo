//
//  CustomAboutProductCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 25/09/23.
//

import UIKit

class CustomAboutProductCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var productName : UILabel!
    @IBOutlet weak var productPrice : UILabel!
    @IBOutlet weak var productInStock : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        productPrice.textColor = .red
    }
}
//MARK: - SetUpProdData Function
extension CustomAboutProductCell{
    func setUpProdData(data : ProductDetail){
        productName.text = data.productName
        productPrice.text  = data.productPrice
        if data.isInStock{
            productInStock.text = "In stock"
        }
        else{
            productInStock.text = "Out of stock"
            productInStock.textColor  = .red
        }
    }
}
