//
//  ReviewAndPaymentViewController.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 25/09/23.
//

import UIKit

class ReviewAndPaymentViewController: ParentVC {
    //MARK: - Outlets
    @IBOutlet weak var reviewAndPaymentTableView : UITableView!
    @IBOutlet weak var proceedButton : UIButton!
    @IBOutlet weak var totalPriceLabel : UILabel!
    //MARK: - Variables
    var dataArray : [ReviewAndPaymentData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareUI()
        self.registerXib()
    }
}
//MARK: - Prepare UI Function
extension ReviewAndPaymentViewController{
    func prepareUI(){
        tabBarController?.tabBar.isHidden = true
        dataArray = ReviewAndPaymentObject().reviewAndPaymentObject()
        proceedButton.layer.cornerRadius = 5
        reviewAndPaymentTableView.delegate = self
        reviewAndPaymentTableView.dataSource = self
    }
    func registerXib(){
        reviewAndPaymentTableView.register(UINib(nibName: "CustomOrderSummaryCell", bundle: nil), forCellReuseIdentifier: "orderSummaryCell")
        reviewAndPaymentTableView.register(UINib(nibName: "CustomDiscountCouponCell", bundle: nil), forCellReuseIdentifier: "discountCouponCell")
    }
}
//MARK: - TableView Functions
extension ReviewAndPaymentViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch dataArray[indexPath.row].cellName{
        case .couponCell:
            let discountCouponCell = tableView.dequeueReusableCell(withIdentifier: "discountCouponCell", for: indexPath) as! CustomDiscountCouponCell
            return discountCouponCell
        case .orderCell:
            let orderSummaryCell = tableView.dequeueReusableCell(withIdentifier: "orderSummaryCell", for: indexPath) as! CustomOrderSummaryCell
            orderSummaryCell.setUpReviewPayData(data: dataArray[indexPath.row])
            return orderSummaryCell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch dataArray[indexPath.row].cellName{
        case .couponCell:
            return 110
        case .orderCell:
            return 170
    }
    }
}
