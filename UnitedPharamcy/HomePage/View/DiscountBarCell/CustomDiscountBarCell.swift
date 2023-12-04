//
//  CustomDiscountBarCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 21/09/23.
//

import UIKit

class CustomDiscountBarCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var discountBarCollectionView : UICollectionView!
    //MARK: - Variables
    var dataArray : [Banner] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
        self.registerXib()
    }
}
//MARK: - SetupUI Function
extension CustomDiscountBarCell{
    func setupUI(){
        discountBarCollectionView.delegate = self
        discountBarCollectionView.dataSource = self
    }
    func registerXib(){
        discountBarCollectionView.register(UINib(nibName: "CustomBarCollectionCell", bundle: nil), forCellWithReuseIdentifier: "barCollectionCell")
    }
}
//MARK: - Collection View Function
extension CustomDiscountBarCell : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let DiscBarCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "barCollectionCell", for: indexPath) as! CustomBarCollectionCell
        DiscBarCollectionCell.setUpDiscountBarData(productData: dataArray[indexPath.row])
        return DiscBarCollectionCell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 5, bottom: 5, right: 5)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width) - 20, height: (collectionView.frame.size.width/3) - 20)
    }
    
}
