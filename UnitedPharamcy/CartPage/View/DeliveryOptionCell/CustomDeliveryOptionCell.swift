//
//  CustomDeliveryOptionCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 19/10/23.
//

import UIKit

class CustomDeliveryOptionCell: UITableViewCell {
    
    @IBOutlet weak var deliveryAddressLabel : UILabel!
    @IBOutlet weak var storePickupAddress : UILabel!
    @IBOutlet weak var addressChangeBtn : UIButton!
    @IBOutlet weak var storeChangeBtn : UIButton!
    @IBOutlet weak var addressView : UIView!
    @IBOutlet weak var storeView : UIView!
    @IBOutlet weak var addressTick : UIImageView!
    @IBOutlet weak var storeTick : UIImageView!

    var btnClosure : ((String) -> ())?
    var viewClosure : ((String) -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
        self.addTapGesture()
    }
}
extension CustomDeliveryOptionCell{
    func setupUI(){
        addressChangeBtn.layer.cornerRadius = 5
        addressView.layer.cornerRadius = 5
        addressView.layer.borderWidth = 0.5
        addressView.layer.borderColor = UIColor(red: 10/255, green: 25/255, blue: 92/255, alpha: 1).cgColor
        addressChangeBtn.layer.borderWidth = 0.5
        addressChangeBtn.layer.cornerRadius = 5
        addressChangeBtn.layer.borderColor = UIColor(red: 10/255, green: 25/255, blue: 92/255, alpha: 1).cgColor
        storeChangeBtn.layer.borderWidth = 0.5
        storeChangeBtn.layer.cornerRadius = 5
        storeChangeBtn.layer.borderColor = UIColor(red: 10/255, green: 25/255, blue: 92/255, alpha: 1).cgColor
        storeTick.isHidden = true
        storeView.backgroundColor = .white
        storeView.layer.cornerRadius = 0.5
        storeView.layer.borderWidth = 0.5
        storeView.layer.cornerRadius = 5
    }
    
    func addTapGesture(){
        let addressTap = UITapGestureRecognizer(target: self, action: #selector(self.addressTap(_:)))
        addressView.addGestureRecognizer(addressTap)
        let storeTap = UITapGestureRecognizer(target: self, action: #selector(self.storeTap(_:)))
        storeView.addGestureRecognizer(storeTap)
    }
}

extension CustomDeliveryOptionCell{
    @objc func addressTap(_ sender: UITapGestureRecognizer? = nil) {
        storeView.backgroundColor = .white
        storeTick.isHidden = true
        storeView.layer.borderColor = UIColor.gray.cgColor
        storeChangeBtn.backgroundColor = .white
        storeChangeBtn.setTitleColor(UIColor(red: 10/255, green: 25/255, blue: 92/255, alpha: 1), for: .normal)
        addressView.backgroundColor = UIColor(red: 239/255, green: 249/255, blue: 255/255, alpha: 1)
        addressView.layer.borderColor = UIColor(red: 10/255, green: 25/255, blue: 92/255, alpha: 1).cgColor
        addressTick.isHidden = false
        addressChangeBtn.backgroundColor = UIColor(red: 10/255, green: 25/255, blue: 92/255, alpha: 1)
        addressChangeBtn.setTitleColor(.white, for: .normal)
        viewClosure?("address")
    }
    
    @objc func storeTap(_ sender: UITapGestureRecognizer? = nil) {
        addressView.backgroundColor = .white
        addressTick.isHidden = true
        addressView.layer.borderColor = UIColor.gray.cgColor
        addressChangeBtn.backgroundColor = .white
        addressChangeBtn.setTitleColor(UIColor(red: 10/255, green: 25/255, blue: 92/255, alpha: 1), for: .normal)
        storeView.backgroundColor = UIColor(red: 239/255, green: 249/255, blue: 255/255, alpha: 1)
        storeView.layer.borderColor = UIColor(red: 10/255, green: 25/255, blue: 92/255, alpha: 1).cgColor
        storeTick.isHidden = false
        storeChangeBtn.backgroundColor = UIColor(red: 10/255, green: 25/255, blue: 92/255, alpha: 1)
        storeChangeBtn.setTitleColor(.white, for: .normal)
        viewClosure?("store")
    }
    @IBAction func addressChangeBtn(_ sender : UIButton){
        btnClosure?("address")
    }
    @IBAction func storeChangeBtn(_ sender : UIButton){
        btnClosure?("store")
    }
}
