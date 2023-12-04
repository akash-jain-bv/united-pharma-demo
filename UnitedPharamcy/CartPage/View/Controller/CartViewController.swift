//
//  CartViewController.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 22/09/23.
//

import UIKit

class CartViewController: ParentVC {
    //MARK: - Outlets
    @IBOutlet weak var cartTableView : UITableView!
    @IBOutlet weak var continueButton : UIButton!
    @IBOutlet weak var timeView : UIView!
    @IBOutlet weak var calenderBtn : UIButton!
    @IBOutlet weak var downTriangle : UIImageView!
    //MARK: - Variables
    var cartData : [CartProductDetails] = []
    var isHomeAddress : Bool = true
    //MARK: - View LifeCycle
    override func viewDidLoad(){
        super.viewDidLoad()
        self.prepareUI()
        self.registerXib()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
        tabBarController?.tabBar.isTranslucent = true
    }
}
//MARK: - Prepare UI function
extension CartViewController{
    func prepareUI(){
        cartData = CartObject.shared.productDetailsObject()
        continueButton.layer.cornerRadius = 5
        cartTableView.delegate = self
        cartTableView.dataSource = self
        continueButton.isEnabled = false
        continueButton.alpha = 0.6
    }
    func registerXib(){
        cartTableView.register(UINib(nibName: "CustomProductCell", bundle: nil), forCellReuseIdentifier: "cartProdCell")
        cartTableView.register(UINib(nibName: "CustomCouponCell", bundle: nil), forCellReuseIdentifier: "couponCell")
        cartTableView.register(UINib(nibName: "CustomOrderSummaryCell", bundle: nil), forCellReuseIdentifier: "orderSummaryCell")
        cartTableView.register(UINib(nibName: "CustomDeliveryOptionCell", bundle: nil), forCellReuseIdentifier: "deliveryCell")
        cartTableView.register(UINib(nibName: "CustomDiscountCouponCell", bundle: nil), forCellReuseIdentifier: "discountCouponCell")
    }
}
//MARK: - Button Action
extension CartViewController{
    @IBAction func calenderButton(_ sender: UIBarButtonItem){
        let storyBoard = UIStoryboard(name: "Cart", bundle: nil)
        if let calenderVC = storyBoard.instantiateViewController(identifier: "CalenderViewController") as? CalenderViewController{
            self.addChild(calenderVC)
            self.view.addSubview(calenderVC.view)
            calenderVC.didMove(toParent: self)
            calenderVC.doneClosure = {[weak self] value in
                if value{
                    self?.continueButton.isEnabled = true
                    self?.continueButton.alpha = 1
                }
                else{
                    self?.continueButton.isEnabled = false
                    self?.continueButton.alpha = 0.6
                }
            }
        }
    }
    func setUpView(value : String){
        if value == "address"{
            isHomeAddress = true
            timeView.isHidden = false
            calenderBtn.isHidden = false
            downTriangle.isHidden = false
            continueButton.alpha = 0.6
            continueButton.isEnabled = false
        }
        else{
            isHomeAddress = false
            timeView.isHidden = true
            calenderBtn.isHidden = true
            downTriangle.isHidden = true
            continueButton.alpha = 1
            continueButton.isEnabled = true
        }
        cartTableView.reloadData()
    }
}
