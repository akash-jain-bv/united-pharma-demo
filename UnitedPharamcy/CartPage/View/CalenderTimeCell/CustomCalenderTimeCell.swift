//
//  CustomCalenderTimeCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 19/10/23.
//

import UIKit

class CustomCalenderTimeCell: UICollectionViewCell {
    
    @IBOutlet weak var dayLabel : UILabel!
    @IBOutlet weak var dateLabel : UILabel!
    @IBOutlet weak var backView : UIView!

    override func awakeFromNib() {
        self.setUpUI()
        super.awakeFromNib()
    }
}

extension CustomCalenderTimeCell{
    func setUpUI(){
        backView.layer.cornerRadius = 5
        backView.layer.borderWidth = 0.5
        backView.layer.borderColor = UIColor(red: 10/255, green: 25/255, blue: 92/255, alpha: 1).cgColor
    }
    func setUpDateData(data : CalenderTime){
        dayLabel.text = data.dayName
        dateLabel.text = data.dateName
    }
}
