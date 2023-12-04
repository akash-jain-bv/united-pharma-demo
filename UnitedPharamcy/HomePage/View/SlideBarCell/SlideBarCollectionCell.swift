//
//  SlideBarCollectionCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 21/09/23.
//

import UIKit

class SlideBarCollectionCell: UICollectionViewCell {
    //MARK: - Outlets
    @IBOutlet weak var barImage : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
//MARK: - Setup Data Functions
extension SlideBarCollectionCell{
    func setUpSlideBarData(productData : Banner){
        self.barImage.layer.cornerRadius = 10
        
        guard let imageURL = URL(string: productData.url ?? "") else {
            return
        }
        CallAPI.shared.downloadImage(imageURL: imageURL, completionHandler: {data in
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.barImage.image = image
                    }
                }
            }
        })
    }
    
    func setUpSlideLabelData(productData : Banner){
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
    
    func setUpOfferSlideLabelData(productData : Banner){
        barImage.layer.cornerRadius = 10
        guard let imageURL = URL(string: productData.bannerImageurl ?? "") else {
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
    func setUpCatgSlideLabelData(productData : CategoryBanner){
        barImage.layer.cornerRadius = 10
        guard let imageURL = URL(string: productData.image ?? "") else {
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
