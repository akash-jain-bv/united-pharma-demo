//
//  ViewAllProductViewController.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 26/09/23.
//

import UIKit

class ViewAllProductViewController: ParentVC {
    
    //MARK: - Outlets
    @IBOutlet weak var iconCollectionView : UICollectionView!
    @IBOutlet weak var viewAllProductsCollectionView : UICollectionView!
    
    //MARK: - Variables
    var collectionDataArray : [IconCollection] = []
    var allproductDataArray : [AllProductData] = []
    var isGridType : Bool = true
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareUI()
        self.registerXib()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        tabBarController?.tabBar .isHidden = false
    }
}
//MARK: - Prepare UI Function
extension ViewAllProductViewController{
    func prepareUI(){
        collectionDataArray = ViewAllProductsObject.shared.iconCollectionObject()
        allproductDataArray = ViewAllProductsObject.shared.allProductObject()
        iconCollectionView.delegate = self
        iconCollectionView.dataSource = self
        viewAllProductsCollectionView.delegate = self
        viewAllProductsCollectionView.dataSource = self
    }
    func registerXib(){
        iconCollectionView.register(UINib(nibName: "CustomIconCollectionCell", bundle: nil), forCellWithReuseIdentifier: "iconCollectionCell")
        viewAllProductsCollectionView.register(UINib(nibName: "CustomAllProdCollCell", bundle: nil), forCellWithReuseIdentifier: "allprodGridCell")
        viewAllProductsCollectionView.register(UINib(nibName: "CustomAllProdListCell", bundle: nil), forCellWithReuseIdentifier: "allProdListCell")
    }
    func presentSort(){
        let storyBoard = UIStoryboard(name: "Home", bundle: nil)
        if let sortVC = storyBoard.instantiateViewController(identifier: "SortByViewController") as? SortByViewController{
            self.addChild(sortVC)
            self.view.addSubview(sortVC.view)
            sortVC.didMove(toParent: self)
        }
    }
}
