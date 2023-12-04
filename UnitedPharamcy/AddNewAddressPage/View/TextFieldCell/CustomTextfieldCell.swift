//
//  CustomTextfieldCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 20/10/23.
//

import UIKit
import SkyFloatingLabelTextField

class CustomTextfieldCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var inputTF : SkyFloatingLabelTextField!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
//MARK: - Setup Data Functions
extension CustomTextfieldCell{
    func setUpTextFieldData(data : TextFields){
        inputTF.title = data.title
        inputTF.placeholder = data.placeholder
    }
}
