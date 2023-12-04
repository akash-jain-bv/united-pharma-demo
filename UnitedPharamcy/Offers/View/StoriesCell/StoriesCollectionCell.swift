//
//  StoriesCollectionCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 03/10/23.
//

import UIKit

class StoriesCollectionCell: UICollectionViewCell {
    //MARK: - Outlets
    @IBOutlet weak var storyImage : UIImageView!
    @IBOutlet weak var storyName : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        storyImage.layer.cornerRadius = 10
    }
}
//MARK: - SetUpStoryData Function
extension StoriesCollectionCell{
    func setUpStoryData(storyData : Specialoffere){
        if storyData.isBestoffer == "1"{
            storyImage.layer.borderWidth = 1
            storyImage.layer.borderColor = UIColor(red: 10/255, green: 25/255, blue: 92/255, alpha: 1).cgColor
            storyName.textColor = UIColor(red: 10/255, green: 25/255, blue: 92/255, alpha: 1)
        }
        guard let imageURL = URL(string: storyData.bannerImageurl ?? "") else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: imageURL) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.storyImage.image = image
                        self?.storyName.text = storyData.offerName
                    }
                }
            }
        }
    }
}
