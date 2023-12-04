//
//  CustomProfilePage.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 04/10/23.
//

import UIKit

class CustomProfilePage: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var profileImage : UIImageView!
    @IBOutlet weak var profileLabel : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
//MARK: - SetUpProfileData Function
extension CustomProfilePage{
    func setUpProfileData(profileData : ProfileData){
        profileImage.image = UIImage(named: profileData.labelImage)
        profileLabel.text = profileData.labelName
    }
}
