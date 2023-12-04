//
//  CustomWishlistCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 05/10/23.
//

import UIKit
import UserNotifications

class CustomWishlistCell: UICollectionViewCell {
    //MARK: - Outlets
    @IBOutlet weak var prodImage : UIImageView!
    @IBOutlet weak var prodName : UILabel!
    @IBOutlet weak var prodPrice : UILabel!
    @IBOutlet weak var inStock : UILabel!
    @IBOutlet weak var quantity : UILabel!
    @IBOutlet weak var quantityView : UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        quantityView.layer.borderWidth = 0.1
        quantityView.layer.cornerRadius = 5
    }
}
//MARK: - SetUpWishlistData Function
extension CustomWishlistCell{
    func setUpWishlistData(wishlistData : WishlistData){
        prodImage.image = UIImage(named: wishlistData.productImage)
        prodName.text = wishlistData.productName
        prodPrice.text = wishlistData.productPrice
        if wishlistData.inStock{
            inStock.isHidden = true
        }
        else{
            inStock.isHidden = false
        }
        let partOne = NSMutableAttributedString(string: "Qty: ", attributes: [.foregroundColor: UIColor.gray, .font: UIFont.systemFont(ofSize: 14)])
        let partTwo = NSMutableAttributedString(string: wishlistData.quantity, attributes: [.foregroundColor: UIColor(red: 0/255, green: 185/255, blue: 242/255, alpha: 1), .font: UIFont.systemFont(ofSize: 14)])
        partOne.append(partTwo)
        quantity.attributedText = partOne

    }
}
//MARK: - Button Actions
extension CustomWishlistCell{
    @IBAction func closeButton(_ sender : UIButton){
        
    }
    @IBAction func moveToCartBtn(_ sender : UIButton){
        self.checkForNotificationPermission()
    }
    func checkForNotificationPermission(){
        let notify = UNUserNotificationCenter.current()
        notify.getNotificationSettings(completionHandler: { settings in
            switch settings.authorizationStatus{
            case .authorized:
                self.sendNotification()
            case .denied:
                return
            case .notDetermined:
                notify.requestAuthorization(options: [.alert,.sound], completionHandler: { (allowed,error) in
                    if allowed{
                        self.sendNotification()
                    }
                })
            default:
                return
            }
        })
    }
    
    func sendNotification(){
        let notify = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = "New item moved to Cart"
        content.body = "Item Moved To Cart"
        content.sound = .default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "my_notification", content: content, trigger: trigger)
        notify.removeAllPendingNotificationRequests()
        notify.add(request)
    }
}
