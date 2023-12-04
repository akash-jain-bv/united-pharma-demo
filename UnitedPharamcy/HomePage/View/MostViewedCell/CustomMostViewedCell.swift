//
//  CustomMostViewedCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 21/09/23.
//

import UIKit

class CustomMostViewedCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var mostViewedCollectionView : UICollectionView!
    //MARK: - Variables
    var dataArray : [ProductList] = []
    var closure : (([String:String])->())?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
        self.registerXib()
    }
}
//MARK: - SetupUI Function
extension CustomMostViewedCell{
    func setupUI(){
        mostViewedCollectionView.delegate = self
        mostViewedCollectionView.dataSource = self
    }
    func registerXib(){
        mostViewedCollectionView.register(UINib(nibName: "TopSellingCollectionCell", bundle: nil), forCellWithReuseIdentifier: "topSellingCollectionCell")
    }
}
//MARK: - Collection View Function
extension CustomMostViewedCell : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let mostViewedCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "topSellingCollectionCell", for: indexPath) as! TopSellingCollectionCell
        mostViewedCollectionCell.setUpMostViewedData(productData: dataArray[indexPath.row])
        mostViewedCollectionCell.layer.borderWidth = 0.2
        mostViewedCollectionCell.layer.cornerRadius = 5
        return mostViewedCollectionCell
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        closure?(["prodName" : dataArray[indexPath.row].name ?? "", "prodPrice" : dataArray[indexPath.row].formattedFinalPrice ?? "", "prodImage" : dataArray[indexPath.row].thumbNail ?? ""])
    }
    
}
