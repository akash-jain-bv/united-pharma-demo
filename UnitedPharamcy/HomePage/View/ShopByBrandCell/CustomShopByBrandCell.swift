//
//  CustomShopByBrandCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 20/09/23.
//

import UIKit

class CustomShopByBrandCell: UITableViewCell {
    
    @IBOutlet weak var brandCollectionView : UICollectionView!
    
    var dataArray : [ShopByBrand] = []
    var viewAllClosure : ((Bool)->())?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
        self.registerXib()
    }   
}

extension CustomShopByBrandCell{
    func setupUI(){
        brandCollectionView.delegate = self
        brandCollectionView.dataSource = self
    }
    func registerXib(){
        brandCollectionView.register(UINib(nibName: "ShopByBrandCollectionCell", bundle: nil), forCellWithReuseIdentifier: "brandCollectionCell")
    }
    @IBAction func viewAllClicked(_ sender : UIButton){
        viewAllClosure?(true)
    }
}
extension CustomShopByBrandCell : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let brandCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "brandCollectionCell", for: indexPath) as! ShopByBrandCollectionCell
        brandCollectionCell.setUpBrandData(productData : dataArray[indexPath.row])
        return brandCollectionCell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width/4) - 8, height: (collectionView.frame.size.width/3) - 15)
    }
}
