//
//  DiscountColloectionCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 20/09/23.
//

import UIKit

class DiscountCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var discountImage : UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension DiscountCollectionCell{
    func setUpDiscountData(data : Discount){
        discountImage.image = UIImage(named: data.imageName)
    }
}
