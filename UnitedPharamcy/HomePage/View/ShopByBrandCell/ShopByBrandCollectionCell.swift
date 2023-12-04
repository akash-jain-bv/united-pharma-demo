//
//  ShopByBrandCollectionCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 20/09/23.
//

import UIKit

class ShopByBrandCollectionCell: UICollectionViewCell {
    //MARK: - Outlets
    @IBOutlet weak var brandImage : UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
//MARK: - Setup data Function
extension ShopByBrandCollectionCell{
    func setUpBrandData(productData : ShopByBrand){
        guard let imageURL = URL(string: productData.brandImage ?? "") else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: imageURL) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.brandImage.image = image
                    }
                }
            }
        }
    }
}
