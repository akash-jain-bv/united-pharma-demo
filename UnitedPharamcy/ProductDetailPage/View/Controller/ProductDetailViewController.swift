//
//  ProductDetailViewController.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 25/09/23.
//

import UIKit

class ProductDetailViewController: ParentVC {
    //MARK: - Outlets
    @IBOutlet weak var addToCartButton : UIButton!
    @IBOutlet weak var buyNowButton : UIButton!
    @IBOutlet weak var productDetailTableView : UITableView!
    //MARK: - Variables
    var dataArray : [ProductDetail] = []
    var aboutProduct : [String : String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareUI()
        self.registerXib()
    }
}
//MARK: - Prepare UI Function
extension ProductDetailViewController{
    
    func prepareUI(){
        tabBarController?.tabBar.isHidden = true
        tabBarController?.tabBar.isTranslucent = true
        addToCartButton.layer.borderWidth = 0.8
        addToCartButton.layer.cornerRadius = 10
        addToCartButton.layer.borderColor = UIColor(red: 10/255, green: 25/255, blue: 92/255, alpha: 1).cgColor
        dataArray = ProductDetailObject().productDetailObject()
        buyNowButton.layer.cornerRadius = 10
        productDetailTableView.delegate = self
        productDetailTableView.dataSource = self
    }
    
    func registerXib(){
        productDetailTableView.register(UINib(nibName: "CustomProductImageCell", bundle: nil), forCellReuseIdentifier: "productImageCell")
        productDetailTableView.register(UINib(nibName: "CustomAboutProductCell", bundle: nil), forCellReuseIdentifier: "aboutProductCell")
        productDetailTableView.register(UINib(nibName: "CustomProductFunctionCell", bundle: nil), forCellReuseIdentifier: "productFunctionCell")
        productDetailTableView.register(UINib(nibName: "CustomProductDetailsCell", bundle: nil), forCellReuseIdentifier: "detailsCell")
    }
}
