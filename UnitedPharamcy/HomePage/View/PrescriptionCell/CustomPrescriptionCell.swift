//
//  CustomPrescriptionCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 20/09/23.
//

import UIKit

class CustomPrescriptionCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var prescriptionView : UIView!
    @IBOutlet weak var offerView : UIView!
    @IBOutlet weak var magazineView : UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }
}
//MARK: - SetupUI Functions
extension CustomPrescriptionCell{
    func setupUI(){
        prescriptionView.layer.cornerRadius = 10
        prescriptionView.layer.borderWidth = 0.3
        prescriptionView.layer.masksToBounds = true
        offerView.layer.cornerRadius = 10
        offerView.layer.borderWidth = 0.3
        offerView.layer.masksToBounds = true
        magazineView.layer.cornerRadius = 10
        magazineView.layer.borderWidth = 0.3
        magazineView.layer.masksToBounds = true
    }
}
