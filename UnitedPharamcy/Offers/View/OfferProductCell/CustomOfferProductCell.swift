//
//  CustomOfferProductCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 03/10/23.
//

import UIKit

class CustomOfferProductCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var productCollectionView : UICollectionView!
    //MARK: - Variables
    var dataArray : [ProductList] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
        self.registerXib()
    }
}
//MARK: - Setup UI Function
extension CustomOfferProductCell{
    func setupUI(){
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
    }
    
    func registerXib(){
        productCollectionView.register(UINib(nibName: "OfferProductCollCell", bundle: nil), forCellWithReuseIdentifier: "prodCollCell")
    }
}
//MARK: - Collection View Functions
extension CustomOfferProductCell : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let prodCollCell = collectionView.dequeueReusableCell(withReuseIdentifier: "prodCollCell", for: indexPath) as! OfferProductCollCell
        prodCollCell.setUpProdData(productData: dataArray[indexPath.row])
        return prodCollCell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width/2) - 20, height: (collectionView.frame.size.width / 1.5))
    }
}
