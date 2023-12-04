//
//  CustomSortByCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 06/11/23.
//

import UIKit

class CustomSortByCell: UITableViewCell {
    
    @IBOutlet weak var selectImage : UIImageView!
    @IBOutlet weak var sortLabel : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool){
        super.setSelected(selected, animated: animated)
        if selected{
            selectImage.image = UIImage(named: "selectRB_ic")
        }
        else{
            selectImage.image = UIImage(named: "unselectRB_ic")
        }
    }
}

extension CustomSortByCell{
    func setUpData(data : SortBy){
        sortLabel.text = data.sortType
    }
}
