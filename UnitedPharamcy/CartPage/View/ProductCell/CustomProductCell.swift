//
//  CustomProductCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 22/09/23.
//

import UIKit

class CustomProductCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var productName : UILabel!
    @IBOutlet weak var productPrice : UILabel!
    @IBOutlet weak var quantity : UILabel!
    @IBOutlet weak var productImage : UIImageView!
    @IBOutlet weak var qtyView : UIView!
    @IBOutlet weak var qtyButton : UIButton!
    @IBOutlet weak var wishListButton : UIButton!
    @IBOutlet weak var deleteButton : UIButton!
//MARK: - Variable
    var numberArray : [NumberOfQty] = []
    var isButtonTap = false
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.setupTableView()
//        self.qtyTableView.isHidden = true
    }
}
//MARK: - SetUpData Function
extension CustomProductCell{
    func setUpProductData(data : CartProductDetails){
        qtyView.layer.borderWidth = 0.2
        qtyView.layer.cornerRadius = 5
        productImage.image = UIImage(named: data.productImage)
        productName.text = data.productName
        productPrice.text = data.productPrice
        quantity.text = "Qty \(data.quantity)"
    }
    func setUpReviewPayData(data : ReviewAndPaymentData){
        qtyButton.isHidden = true
        wishListButton.isHidden = true
        deleteButton.isHidden = true
        productImage.image = UIImage(named: data.productImage)
        productName.text = data.productName
        productPrice.text = data.productPrice
        quantity.text = "Qty \(data.quantity)"
//        subtotal.text = data.subtotal
    }
}
////MARK: - TableView Function
//extension CustomProductCell : UITableViewDelegate,UITableViewDataSource{
//    func setupTableView(){
//        numberArray = CartObject().numberObject()
//        qtyTableView.layer.borderWidth = 0.3
//        qtyTableView.layer.cornerRadius = 5
//        qtyTableView.delegate = self
//        qtyTableView.dataSource = self
//        qtyTableView.register(UINib(nibName: "CustomDropDownCell", bundle: nil), forCellReuseIdentifier: "dropDownCell")
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return numberArray.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let numberCell = tableView.dequeueReusableCell(withIdentifier: "dropDownCell", for: indexPath) as! CustomDropDownCell
//        numberCell.accessoryType = .none
//        numberCell.setUpQtyData(data: numberArray[indexPath.row])
//        return numberCell
//    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        quantity.text = "Qty:\(numberArray[indexPath.row].number)"
//        self.qtyTableView.isHidden = true
//        isButtonTap = false
//    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 30
//    }
//}
//MARK: - Button Action
extension CustomProductCell{
    @IBAction func qtyButtonTap(_ sender : UIButton){
        if isButtonTap == false{
//            qtyTableView.isHidden = false
            isButtonTap = true
        }
        else{
//            qtyTableView.isHidden = true
            isButtonTap = false
        }
    }
}
