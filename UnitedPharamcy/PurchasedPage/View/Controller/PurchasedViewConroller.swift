//
//  PurchasedViewConroller.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 25/09/23.
//

import UIKit

class PurchasedViewConroller: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var contShopButton : UIButton!
    @IBOutlet weak var tickImageView : UIImageView!
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareUI()
    }
}
//MARK: - Prepare UI Function
extension PurchasedViewConroller{
    func prepareUI(){
        contShopButton.layer.cornerRadius = 5
        tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.isHidden = true
        tickImageView.layer.cornerRadius = 45
        tickImageView.layer.borderWidth = 5
        tickImageView.layer.borderColor = UIColor.white.cgColor
    }
}
//MARK: - Button Action
extension PurchasedViewConroller{
    @IBAction func contShopClicked(_ sender : UIButton){
        navigationController?.popToRootViewController(animated: true)
    }
}
