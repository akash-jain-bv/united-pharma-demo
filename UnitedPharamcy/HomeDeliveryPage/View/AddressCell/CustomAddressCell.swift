//
//  CustomAddressCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 25/09/23.
//

import UIKit

class CustomAddressCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var addressLabel : UILabel!
    @IBOutlet weak var backView : UIView!
    @IBOutlet weak var selectedAddImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
//MARK: - Action and Function
extension CustomAddressCell{
    func setUpAddressData(data : DeliveryAddress){
        addressLabel.text = data.address
        nameLabel.text = data.name
    }
    func setUpStoreData(data : StoreAddress){
        addressLabel.text = data.storeAddress
        nameLabel.text = data.storeName
    }
    @IBAction func editClicked(_ sender : UIButton){
        
    }
}
