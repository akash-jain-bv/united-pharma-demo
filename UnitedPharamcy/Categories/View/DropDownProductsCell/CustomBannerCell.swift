//
//  CustomBannerCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 27/09/23.
//

import UIKit

class CustomBannerCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var iconImage : UIImageView!
    @IBOutlet weak var labelTitle : UILabel!
    @IBOutlet weak var dropDownButton : UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(animated, animated: true)
        if selected{
            dropDownButton.setImage(UIImage(named: "upButton"), for: .normal)
        }
        else{
            dropDownButton.setImage(UIImage(named: "arrow-ios-down-outline"), for: .normal)
        }
    }
}
//MARK: - SetUpDropData Function
extension CustomBannerCell{
    func setUpDropData(productData : CategoryDrop){
        if let imageURL = URL(string: productData.mediumMobileImage ?? ""){
            CallAPI.shared.downloadImage(imageURL: imageURL, completionHandler: {data in
                DispatchQueue.main.async {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self.iconImage.image = image
                            self.labelTitle.text = productData.name
                        }
                    }
                }
            })
        }
        else {
            DispatchQueue.main.async {
                if let image = UIImage(named: "Image 20") {
                    DispatchQueue.main.async {
                        self.iconImage.image = image
                        self.labelTitle.text = productData.name
                    }
                }
            }
        }
    }
}
