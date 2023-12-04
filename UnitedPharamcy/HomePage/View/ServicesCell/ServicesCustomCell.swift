//
//  ServicesCustomCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 20/09/23.
//

import UIKit

class ServicesCustomCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var servicesCollectionView : UICollectionView!
    //MARK: - Variables
    var dataArray : [Banner] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
        self.registerXib()
    }
}
//MARK: - SetupUI Functions
extension ServicesCustomCell{
    func setupUI(){
        servicesCollectionView.delegate = self
        servicesCollectionView.dataSource = self
    }
    func registerXib(){
        servicesCollectionView.register(UINib(nibName: "CustomBarCollectionCell", bundle: nil), forCellWithReuseIdentifier: "barCollectionCell")
    }
}
//MARK: - Collection View Function
extension ServicesCustomCell : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let servicesCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "barCollectionCell", for: indexPath) as! CustomBarCollectionCell
        servicesCollectionCell.setUpServicesData(productData: dataArray[indexPath.row])
        return servicesCollectionCell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width) - 20, height: (collectionView.frame.size.width/3) - 20)
    }
}
