//
//  CustomProductDetailsCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 25/09/23.
//

import UIKit

class CustomProductDetailsCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var detailsLabel : UILabel!
    //MARK: - Variables
    var labelIsHidden : Bool = true

    override func awakeFromNib() {
        super.awakeFromNib()
        detailsLabel.isHidden = true
    }
}
//MARK: - Button Action
extension CustomProductDetailsCell{
    @IBAction func detailsButtonClicked(_ sender : UIButton){
        if labelIsHidden{
            detailsLabel.isHidden = false
            labelIsHidden = false
        }
        else{
            detailsLabel.isHidden = true
            labelIsHidden = true
        }
    }
}
