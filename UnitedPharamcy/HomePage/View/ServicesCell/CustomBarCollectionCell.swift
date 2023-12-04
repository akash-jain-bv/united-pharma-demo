//
//  CustomBarCollectionCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 20/09/23.
//

import UIKit

class CustomBarCollectionCell: UICollectionViewCell {
    //MARK: - Outlets
    @IBOutlet weak var barImage : UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        barImage.layer.cornerRadius = 10
    }
}
//MARK: - Set up data Functions
extension CustomBarCollectionCell{
    func setUpServicesData(productData : Banner){
        guard let imageURL = URL(string: productData.url ?? "") else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: imageURL) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.barImage.image = image
                    }
                }
            }
        }
    }
    func setUpDiscountBarData(productData : Banner){
        guard let imageURL = URL(string: productData.url ?? "") else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: imageURL) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.barImage.image = image
                    }
                }
            }
        }
    }
}
