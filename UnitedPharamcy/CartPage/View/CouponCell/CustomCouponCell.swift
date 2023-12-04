//
//  CustomCouponCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 22/09/23.
//

import UIKit

class CustomCouponCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var couponTextField : UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        couponTextField.layer.cornerRadius = 10
    }
}
