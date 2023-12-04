//
//  CartViewController+TableViewFunctions.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 31/10/23.
//

import UIKit
//MARK: - Table View Functions
extension CartViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch cartData[indexPath.row].cellName {
        case .deliveryOptionCell:
            let deliveryCell = tableView.dequeueReusableCell(withIdentifier: "deliveryCell", for: indexPath) as! CustomDeliveryOptionCell
            deliveryCell.btnClosure = {[weak self] value in
                let storyBoard = UIStoryboard(name: "Cart", bundle: nil)
                if value == "address"{
                    deliveryCell.addressTap()
                    if let addressVC = storyBoard.instantiateViewController(identifier: "HomeDeliveryViewController") as? HomeDeliveryViewController{
                        self?.navigationController?.pushViewController(addressVC, animated: true)
                    }
                }
                else{
                    deliveryCell.storeTap()
                    if let addressVC = storyBoard.instantiateViewController(identifier: "ChangeStoreViewController") as? ChangeStoreViewController{
                        self?.navigationController?.pushViewController(addressVC, animated: true)
                    }
                }
            }
            deliveryCell.viewClosure = {[weak self] value in
                self?.setUpView(value: value)
            }
            return deliveryCell
        case .productCell:
            let cartProdCell = tableView.dequeueReusableCell(withIdentifier: "cartProdCell", for: indexPath) as! CustomProductCell
            cartProdCell.setUpProductData(data: cartData[indexPath.row])
            return cartProdCell
        case .couponCell:
            switch isHomeAddress {
            case true:
                let couponCell = tableView.dequeueReusableCell(withIdentifier: "couponCell", for: indexPath) as! CustomCouponCell
                return couponCell
           case false:
            let discountCouponCell = tableView.dequeueReusableCell(withIdentifier: "discountCouponCell", for: indexPath) as! CustomDiscountCouponCell
            return discountCouponCell
            }
        case .orderSummaryCell:
            let orderSummaryCell = tableView.dequeueReusableCell(withIdentifier: "orderSummaryCell", for: indexPath) as! CustomOrderSummaryCell
            orderSummaryCell.setUpOrderSummaryData(data : cartData[indexPath.row])
            return orderSummaryCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch cartData[indexPath.row].cellName {
        case .deliveryOptionCell:
            return 170
        case .productCell:
            return 120
        case .couponCell:
            switch isHomeAddress{
            case true:
                return 75
            case false:
                return 110
            }
        case .orderSummaryCell:
            return 180
        }
    }
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let codView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
//        codView.backgroundColor = UIColor(red: 10/255, green: 25/255, blue: 92/255, alpha: 1)
//        let label = UILabel()
//        label.frame = CGRect.init(x: 5, y: 5, width:tableView.frame.size.width - 10 , height: 40)
//        label.layer.borderWidth = 3
//        label.layer.cornerRadius = 10
//        label.layer.borderColor = UIColor.systemYellow.cgColor
//        let partOne = NSMutableAttributedString(string: "Pay \"Cash on delivery\"", attributes: [.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 16)])
//        let partTwo = NSMutableAttributedString(string: " without additional fees", attributes: [.foregroundColor: UIColor.systemYellow, .font: UIFont.boldSystemFont(ofSize: 16)])
//        partOne.append(partTwo)
//        label.attributedText = partOne
//        label.textAlignment = .center
//        codView.addSubview(label)
//        return codView
//    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 50
//    }
}
