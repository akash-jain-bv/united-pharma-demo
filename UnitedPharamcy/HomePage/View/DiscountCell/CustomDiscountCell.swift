//
//  CustomDiscountCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 20/09/23.
//

import UIKit

class CustomDiscountCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var discountCollectionView : UICollectionView!
    //MARK: - Variables
    var dataArray : [Banner] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        self.registerXib()
        self.setupUI()
    }
}
//MARK: - SetupUI Function
extension CustomDiscountCell{
    func setupUI(){
        discountCollectionView.delegate = self
        discountCollectionView.dataSource = self
    }
    func registerXib(){
        discountCollectionView.register(UINib(nibName: "DiscountCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "discountCollectionCell")
    }
}
//MARK: - Collection View Function
extension CustomDiscountCell : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let discountCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "discountCollectionCell", for: indexPath) as! DiscountCollectionViewCell
        discountCollectionCell.setUpDiscountData(productData: dataArray[indexPath.row])
        return discountCollectionCell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width/2) - 20, height: (collectionView.frame.size.width/2) - 20)
    }
}
