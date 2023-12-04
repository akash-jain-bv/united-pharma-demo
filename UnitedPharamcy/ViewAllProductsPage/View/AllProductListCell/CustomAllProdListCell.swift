//
//  CustomAllProdListCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 17/10/23.
//

import UIKit

class CustomAllProdListCell: UICollectionViewCell {
    //MARK: - Outlets
    @IBOutlet weak var imageView : UIImageView!
    @IBOutlet weak var offerLabel : UILabel!
    @IBOutlet weak var priceLabel : UILabel!
    @IBOutlet weak var nameLabel : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        offerLabel.layer.cornerRadius = 5
        offerLabel.layer.masksToBounds = true
    }
}
