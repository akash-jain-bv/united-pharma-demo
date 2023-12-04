//
//  ShopByCategoryCollCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 20/09/23.
//

import UIKit

class ShopByCategoryCollCell: UICollectionViewCell {
    //MARK: - Outlets
    @IBOutlet weak var image : UIImageView!
    @IBOutlet weak var aboutLabel : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
//MARK: - SetUpModelData Function
extension ShopByCategoryCollCell{
    func setUpModelData(productData : FeaturedCategory){
        guard let imageURL = URL(string: productData.url ?? "") else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: imageURL) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image.image = image
                        self?.aboutLabel.text = productData.categoryName
                    }
                }
            }
        }
    }
}
