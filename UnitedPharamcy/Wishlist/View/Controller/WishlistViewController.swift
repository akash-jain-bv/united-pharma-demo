//
//  WishlistViewController.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 05/10/23.
//

import UIKit

class WishlistViewController: ParentVC {
    //MARK: - Outlets
    @IBOutlet weak var wishlistCollectionView : UICollectionView!
    @IBOutlet weak var updateWishlist : UIButton!
    @IBOutlet weak var addAllToCart : UIButton!
    //MARK: - Variables
    var dataArray : [WishlistData] = []
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        dataArray = WishlistObject().wishlistObject()
        super.viewDidLoad()
        self.setupUI()
        self.registerXib()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        tabBarController?.tabBar .isHidden = false
        tabBarController?.tabBar.isTranslucent = false
    }
}
//MARK: - SetupUI Function
extension WishlistViewController{
    func setupUI(){
        addAllToCart.layer.cornerRadius = 5
        updateWishlist.layer.cornerRadius = 5
        updateWishlist.layer.borderWidth = 1
        updateWishlist.layer.borderColor = UIColor(red: 10/255, green: 25/255, blue: 92/255, alpha: 1).cgColor
        wishlistCollectionView.delegate = self
        wishlistCollectionView.dataSource = self
    }
    func registerXib(){
        wishlistCollectionView.register(UINib(nibName: "CustomWishlistCell", bundle: nil), forCellWithReuseIdentifier: "wishlistCell")
    }
}
//MARK: - CollectionView Function
extension WishlistViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let wishlistCell = collectionView.dequeueReusableCell(withReuseIdentifier: "wishlistCell", for: indexPath) as! CustomWishlistCell
        wishlistCell.layer.borderWidth = 0.2
        wishlistCell.layer.cornerRadius = 5
        wishlistCell.setUpWishlistData(wishlistData: dataArray[indexPath.row])
        return wishlistCell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 0, right: 5)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width/2) - 10, height: (collectionView.frame.size.width/2) + 70)
    }
}
