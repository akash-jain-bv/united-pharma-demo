//
//  CustomAllProdCollCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 26/09/23.
//

import UIKit

class CustomAllProdGridCell: UICollectionViewCell {
    //MARK: - Outlets
    @IBOutlet weak var freeLabel : UILabel!
    @IBOutlet weak var prodImage : UIImageView!
    @IBOutlet weak var prodPrice : UILabel!
    @IBOutlet weak var prodDescription : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        freeLabel.layer.cornerRadius = 10
    }
}
//MARK: - SetUpAllProdData Function
extension CustomAllProdGridCell{
    func setUpAllProdData(data : AllProductData){
        freeLabel.text = data.prodFreeStatus
        prodImage.image = UIImage(named: data.imageName)
        prodPrice.text = data.prodPrice
        prodDescription.text = data.prodDescription
    }
}
