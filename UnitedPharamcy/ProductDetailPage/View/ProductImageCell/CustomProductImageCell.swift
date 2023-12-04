//
//  CustomProductImageCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 25/09/23.
//

import UIKit

class CustomProductImageCell: UITableViewCell {
    //MARK: - Outlet
    @IBOutlet weak var productImage : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
//MARK: - SetUpImageData Function
extension CustomProductImageCell{
    func setUpImageData(data : String){
        guard let imageURL = URL(string: data) else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: imageURL) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.productImage.image = image
                    }
                }
            }
        }
    }
}
