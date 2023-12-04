//
//  CustomMapViewCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 20/10/23.
//

import UIKit
import MapKit

class CustomMapViewCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var cancelBtn : UIButton!
    @IBOutlet weak var pickUpBtn : UIButton!
    @IBOutlet weak var storeName : UILabel!
    @IBOutlet weak var storeAddress : UILabel!
    @IBOutlet weak var storeTime : UILabel!
    @IBOutlet weak var storeMapView : MKMapView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }
}
//MARK: - Setup UI Function
extension CustomMapViewCell{
    func setupUI(){
        cancelBtn.layer.borderWidth = 0.5
        cancelBtn.layer.borderColor = UIColor(red: 10/255, green: 25/255, blue: 92/255, alpha: 1).cgColor
        cancelBtn.layer.cornerRadius = 5
        pickUpBtn.layer.cornerRadius = 5
    }
}
