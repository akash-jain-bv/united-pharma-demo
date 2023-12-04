//
//  CustomIconCollectionCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 26/09/23.
//

import UIKit

class CustomIconCollectionCell: UICollectionViewCell {
    //MARK: - Outlets
    @IBOutlet weak var iconButton : UIButton!
    @IBOutlet weak var sideView : UIView!
    //MARK: - Variables
    var typeClosure : ((String) -> ())?
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
//MARK: - SetUpIconData Function
extension CustomIconCollectionCell{
    func setUpIconData(data : IconCollection){
        iconButton.setTitle(data.name, for: .normal)
        iconButton.setImage(UIImage(named: data.imageName), for: .normal)
        if data.name == " GRID"{
            sideView.isHidden = true
        }
    }
    @IBAction func iconButtonClicked(_ sender : UIButton){
        if sender.currentTitle == " GRID"{
            sender.setImage(UIImage(named: "menu-outline"), for: .normal)
            sender.setTitle(" LIST", for: .normal)
            typeClosure?("list")
        }
        else if sender.currentTitle == " LIST"{
            sender.setTitle(" GRID", for: .normal)
            sender.setImage(UIImage(named: "Group 9942"), for: .normal)
            typeClosure?("grid")
        }
        else if sender.currentTitle == " SORT"{
            typeClosure?("sort")
        }
    }
}
