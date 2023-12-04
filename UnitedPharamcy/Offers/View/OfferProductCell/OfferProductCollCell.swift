//
//  OfferProductCollCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 03/10/23.
//

import UIKit

class OfferProductCollCell: UICollectionViewCell {
    //MARK: - Outlets
    @IBOutlet weak var productImage : UIImageView!
    @IBOutlet weak var productName : UILabel!
    @IBOutlet weak var productPrice : UILabel!
    @IBOutlet weak var wishlistButton : UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
//MARK: - SetUpProdData Function
extension OfferProductCollCell{
    func setUpProdData(productData : ProductList){
        guard let imageURL = URL(string: productData.thumbNail ?? "") else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: imageURL) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.productImage.image = image
                        self?.productName.text = productData.name
                        self?.productPrice.text = "\(productData.finalPrice ?? 0)SAR"
                    }
                }
            }
        }
    }
}
