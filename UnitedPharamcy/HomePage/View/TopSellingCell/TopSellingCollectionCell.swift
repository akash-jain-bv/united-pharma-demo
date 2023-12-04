//
//  TopSellingCollectionCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 20/09/23.
//

import UIKit

class TopSellingCollectionCell: UICollectionViewCell {
    //MARK: - Outlets
    @IBOutlet weak var imageName :UIImageView!
    @IBOutlet weak var priceTextView : UITextView!
    @IBOutlet weak var descriptionLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        priceTextView.font = .boldSystemFont(ofSize: 14)
    }
}
//MARK: - Setup Data Functions
extension TopSellingCollectionCell{
    func setUpTopSellingData(productData : ProductList){
        guard let imageURL = URL(string: productData.thumbNail ?? "") else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: imageURL) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.imageName.image = image
                        self?.priceTextView.text = productData.formattedFinalPrice
                        self?.descriptionLabel.text = productData.name
                    }
                }
            }
        }
    }
    func setUpMostViewedData(productData : ProductList){
        guard let imageURL = URL(string: productData.thumbNail ?? "") else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: imageURL) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.imageName.image = image
                        self?.priceTextView.text = productData.formattedFinalPrice
                        self?.descriptionLabel.text = productData.name
                    }
                }
            }
        }
    }
    
    func setUpChosenForYouData(productData : ProductList){
        guard let imageURL = URL(string: productData.thumbNail ?? "") else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: imageURL) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.imageName.image = image
                        self?.priceTextView.text = productData.formattedFinalPrice
                        self?.descriptionLabel.text = productData.name
                    }
                }
            }
        }
    }
}
