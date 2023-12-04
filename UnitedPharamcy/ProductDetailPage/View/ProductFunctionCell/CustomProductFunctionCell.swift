//
//  CustomProductFunctionCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 25/09/23.
//

import UIKit

class CustomProductFunctionCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var qtyLabel : UILabel!
    @IBOutlet weak var minusButton : UIButton!
    @IBOutlet weak var plusButton : UIButton!
    //MARK: - Variable
    var quantity = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        minusButton.layer.cornerRadius = 10
        plusButton.layer.cornerRadius = 10
    }
}
//MARK: - Button Action
extension CustomProductFunctionCell{
    @IBAction func qtyPlusButton(_ sender : UIButton){
        quantity += 1
        qtyLabel.text = "\(quantity)"
    }
    @IBAction func qtyMinusButton(_ sender : UIButton){
        if quantity > 1{
            quantity -= 1
            qtyLabel.text = "\(quantity)"
        }
    }
}
