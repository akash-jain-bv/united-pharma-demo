//
//  DiscountCollectionViewCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 20/09/23.
//

import UIKit

class DiscountCollectionViewCell: UICollectionViewCell {
    //MARK: - Outlets
    @IBOutlet weak var discountImage : UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        discountImage.layer.cornerRadius = 10
        discountImage.layer.masksToBounds = true
    }

}
//MARK: - SetUpDiscountData Function
extension DiscountCollectionViewCell{
    func setUpDiscountData(productData : Banner){
        guard let imageURL = URL(string: productData.url ?? "") else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: imageURL) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.discountImage.image = image
                    }
                }
            }
        }
    }
}
