//
//  CustomChosenForYouCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 21/09/23.
//

import UIKit

class CustomChosenForYouCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var chosenForYouCollectionView : UICollectionView!
    //MARK: - Variables
    var dataArray : [ProductList] = []
    var viewAllClosure : ((Bool)->())?
    var closure : (([String:String])->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
        self.registerXib()
    }
}
//MARK: - SetupUI Function
extension CustomChosenForYouCell{
    func setupUI(){
        chosenForYouCollectionView.delegate = self
        chosenForYouCollectionView.dataSource = self
    }
    func registerXib(){
        chosenForYouCollectionView.register(UINib(nibName: "TopSellingCollectionCell", bundle: nil), forCellWithReuseIdentifier: "topSellingCollectionCell")
    }
    @IBAction func viewAllClicked(_ sender : UIButton){
        viewAllClosure?(true)
    }
}
//MARK: - Collection View Function
extension CustomChosenForYouCell : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let chosenForYouCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "topSellingCollectionCell", for: indexPath) as! TopSellingCollectionCell
        chosenForYouCollectionCell.setUpChosenForYouData(productData: dataArray[indexPath.row])
        chosenForYouCollectionCell.layer.borderWidth = 0.2
        chosenForYouCollectionCell.layer.cornerRadius = 5
        return chosenForYouCollectionCell
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
