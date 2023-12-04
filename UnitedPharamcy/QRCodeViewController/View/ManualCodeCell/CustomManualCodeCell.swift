//
//  CustomManualCodeCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 20/10/23.
//

import UIKit

class CustomManualCodeCell: UICollectionViewCell {
    //MARK: - Outlets
    @IBOutlet weak var submitBtn : UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        submitBtn.layer.cornerRadius = 5
    }

}
