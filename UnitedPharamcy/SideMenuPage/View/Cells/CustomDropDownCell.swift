//
//  CustomDropDownCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 22/09/23.
//

import UIKit

class CustomDropDownCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var descriptionLabel :UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
//MARK: - Setup Data Function
extension CustomDropDownCell{
    func setUpdropDownData(data : DropDown){
        descriptionLabel.text = data.description
    }
    func setUpQtyData(data : NumberOfQty){
        descriptionLabel.text = data.number
    }
}
