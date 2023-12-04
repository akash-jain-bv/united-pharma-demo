//
//  CustomOrderSummaryCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 25/09/23.
//

import UIKit

class CustomOrderSummaryCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var subtotalLabel : UILabel!
    @IBOutlet weak var taxLabel : UILabel!
    @IBOutlet weak var orderTotalLabel : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
//MARK: - Set Up Data Functins
extension CustomOrderSummaryCell{
    func setUpOrderSummaryData(data : CartProductDetails){
        subtotalLabel.text = data.subtotal
        taxLabel.text = data.tax
        orderTotalLabel.text = data.orderTotal
    }
    func setUpReviewPayData(data : ReviewAndPaymentData){
        subtotalLabel.text = data.subtotal
        taxLabel.text = data.tax
        orderTotalLabel.text = data.orderTotal
    }
    
    
}
