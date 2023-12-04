//
//  ViewAllProductViewController+CollectionViewFunctions.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 31/10/23.
//

import UIKit
//MARK: - Collection View Functions
extension ViewAllProductViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == iconCollectionView{
            return collectionDataArray.count
        }
        else{
            return allproductDataArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == iconCollectionView{
            let iconCell = collectionView.dequeueReusableCell(withReuseIdentifier: "iconCollectionCell", for: indexPath) as! CustomIconCollectionCell
            iconCell.setUpIconData(data: collectionDataArray[indexPath.row])
            iconCell.typeClosure = {[weak self] type in
                if type == "grid"{
                    self?.isGridType = true
                }
                else if type == "list"{
                    self?.isGridType = false
                }
                else if type == "sort"{
                    self?.presentSort()
                }
                self?.viewAllProductsCollectionView.reloadData()
            }
            return iconCell
        }
        else{
            switch isGridType{
            case true:
                let allprodGridCell = collectionView.dequeueReusableCell(withReuseIdentifier: "allprodGridCell", for: indexPath) as! CustomAllProdGridCell
                allprodGridCell.layer.borderWidth = 0.3
                allprodGridCell.layer.cornerRadius = 10
                allprodGridCell.setUpAllProdData(data: allproductDataArray[indexPath.row])
                return allprodGridCell
            case false:
                let allProdListCell = collectionView.dequeueReusableCell(withReuseIdentifier: "allProdListCell", for: indexPath) as! CustomAllProdListCell
                allProdListCell.layer.borderWidth = 0.3
                allProdListCell.layer.cornerRadius = 10
                return allProdListCell
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == iconCollectionView{
            return CGSize(width: (collectionView.frame.size.width / 3), height: 50)
        }
        else{
            switch isGridType{
            case true:
                return CGSize(width: (collectionView.frame.size.width/2) - 20, height: (collectionView.frame.size.width/2) + 20)
            case false:
                return CGSize(width: (collectionView.frame.size.width) - 20, height: (collectionView.frame.size.width/2) - 50)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == viewAllProductsCollectionView{
            return 8
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == viewAllProductsCollectionView{
            switch isGridType {
            case true:
                return UIEdgeInsets(top: 10, left: 13, bottom: 0, right: 13)
            case false:
                return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
            }
        }
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
