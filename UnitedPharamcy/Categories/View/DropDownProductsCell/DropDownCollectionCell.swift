//
//  DropDownCollectionCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 26/09/23.
//

import UIKit

class DropDownCollectionCell: UICollectionViewCell {
    //MARK: - Outlets
    @IBOutlet weak var prodImage : UIImageView!
    @IBOutlet weak var prodLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
//MARK: - SetUpdropDownClData Function
extension DropDownCollectionCell{
    func setUpdropDownClData(productData : CategoryDrop){
        if let imageURL = URL(string: productData.mediumMobileImage ?? ""){
            CallAPI.shared.downloadImage(imageURL: imageURL, completionHandler: {data in
                DispatchQueue.main.async {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self.prodImage.image = image
                            self.prodLabel.text = productData.name
                        }
                    }
                }
            })
        }
        else {
            let prodImage = UIImage(named: "wishlist2")
                DispatchQueue.main.async {
                    self.prodImage.image = prodImage
                    self.prodLabel.text = productData.name
            }
        }
    }
}
