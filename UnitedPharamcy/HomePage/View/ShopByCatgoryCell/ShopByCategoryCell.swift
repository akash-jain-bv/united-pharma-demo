//
//  ShopByCategoryCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 20/09/23.
//

import UIKit

class ShopByCategoryCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var shopCollectionView : UICollectionView!
    //MARK: - Variables
    var dataArray : [FeaturedCategory] = []
    var viewAllClosure : ((Bool)->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.registerXib()
        self.setupUI()
    }
}
//MARK: - SetupUI Function
extension ShopByCategoryCell{
    func setupUI(){
        shopCollectionView.delegate = self
        shopCollectionView.dataSource = self
    }
    func registerXib(){
        shopCollectionView.register(UINib(nibName: "ShopByCategoryCollCell", bundle: nil), forCellWithReuseIdentifier: "shopCollectionCell")
    }
    @IBAction func viewAllClicked(_ sender : UIButton){
        viewAllClosure?(true)
    }
}
//MARK: - Collection View Functions
extension ShopByCategoryCell : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let shopCell = collectionView.dequeueReusableCell(withReuseIdentifier: "shopCollectionCell", for: indexPath) as! ShopByCategoryCollCell
        shopCell.setUpModelData(productData: dataArray[indexPath.row])
        return shopCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width/4) - 8, height: (collectionView.frame.size.width/3) - 20)
    }
}
