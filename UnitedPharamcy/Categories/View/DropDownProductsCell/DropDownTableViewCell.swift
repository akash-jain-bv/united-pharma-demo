//
//  dropDownTableViewCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 26/09/23.
//

import UIKit

class DropDownTableViewCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var dropDownCollectionView : UICollectionView!
    //MARK: - Variables
    var dataArrayCl : [CategoryDrop] = []
    var isDropped : Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
        self.registerXib()
    }
}
//MARK: - SetupUI Function
extension DropDownTableViewCell{
    func setupUI(){
        dropDownCollectionView.delegate = self
        dropDownCollectionView.dataSource = self
    }
    func registerXib(){
        dropDownCollectionView.register(UINib(nibName: "DropDownCollectionCell", bundle: nil), forCellWithReuseIdentifier: "dropDownClCell")
    }
}
//MARK: - CollectionView Function
extension DropDownTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArrayCl.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dropDownClCell = collectionView.dequeueReusableCell(withReuseIdentifier: "dropDownClCell", for: indexPath) as! DropDownCollectionCell
        dropDownClCell.setUpdropDownClData(productData: dataArrayCl[indexPath.row])
        return dropDownClCell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width/3) - 20, height: (collectionView.frame.size.width/2) - 20)
    }
}
