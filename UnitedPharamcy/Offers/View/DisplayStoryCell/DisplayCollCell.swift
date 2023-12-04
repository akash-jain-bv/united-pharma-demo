//
//  DisplayCollCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 03/10/23.
//

import UIKit

class DisplayCollCell: UICollectionViewCell {
    //MARK: - Outlets
    @IBOutlet weak var displayImage : UIImageView!
    @IBOutlet weak var storyImage : UIImageView!
    @IBOutlet weak var storyName : UILabel!
    @IBOutlet weak var viewToRight : UIView!
    @IBOutlet weak var viewToLeft : UIView!
//MARK: - Variables
    var closeClosure : (()->())?
    var swipeClosure : ((String)->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }
}

extension DisplayCollCell{
    func setupUI(){
        storyImage.layer.cornerRadius = 10
        let tapGestureToRight = UITapGestureRecognizer(target: self, action: #selector(didTapRightView(_:)))
        viewToRight.addGestureRecognizer(tapGestureToRight)
        let tapGestureToLeft = UITapGestureRecognizer(target: self, action: #selector(didTapLeftView(_:)))
        viewToLeft.addGestureRecognizer(tapGestureToLeft)
    }
}
//MARK: - Action and Function
extension DisplayCollCell{
    func setUpDisplayStory(storyData : DisplayStoryData){
        displayImage.image = UIImage(named: storyData.displayImage)
    }
    @IBAction func closeButtonClicked(_ sender : UIButton){
        closeClosure?()
    }
    @objc private func didTapRightView(_ sender: UITapGestureRecognizer) {
        swipeClosure?("right")
    }
    @objc private func didTapLeftView(_ sender: UITapGestureRecognizer) {
        swipeClosure?("left")
    }
}

