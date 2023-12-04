//
//  CustomStoriesCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 03/10/23.
//

import UIKit

class CustomStoriesCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var storyCollectionView : UICollectionView!
    //MARK: - Variables
    var storyClosure : ((String,String)->())?
    var storyCellData : [Specialoffere] = []
    var selectedCellIndex = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
        self.registerXib()
    }
}
//MARK: - Setup UI Function
extension CustomStoriesCell{
    func setupUI(){
        OffersObject.shared.callOffersStoryAPI(completionHandler: {[weak self] dataValue in
            self?.storyCellData = dataValue
            self?.storyCollectionView.reloadData()
        })
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
    }
    func registerXib(){
        storyCollectionView.register(UINib(nibName: "StoriesCollectionCell", bundle: nil), forCellWithReuseIdentifier: "storyCollCell")
    }
}
//MARK: - Collection View Function
extension CustomStoriesCell : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storyCellData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let storyCollCell = collectionView.dequeueReusableCell(withReuseIdentifier: "storyCollCell", for: indexPath) as! StoriesCollectionCell
        collectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: UICollectionView.ScrollPosition.centeredHorizontally)
        storyCollCell.storyImage.layer.borderWidth = 0
        storyCollCell.storyImage.layer.borderColor = UIColor.black.cgColor
        storyCollCell.storyName.textColor = .black
        storyCollCell.setUpStoryData(storyData: storyCellData[indexPath.row])
        return storyCollCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width/4) - 8, height: (collectionView.frame.size.width/4) - 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let storyCollCell = collectionView.cellForItem(at: indexPath) as? StoriesCollectionCell,let cellId = storyCellData[indexPath.row].id,let bestOffer = storyCellData[indexPath.row].isBestoffer{
            selectedCellIndex = indexPath.row
            storyCollCell.storyImage.layer.borderWidth = 1
            storyCollCell.storyImage.layer.borderColor = UIColor(red: 10/255, green: 25/255, blue: 92/255, alpha: 1).cgColor
            storyCollCell.storyName.textColor = UIColor(red: 10/255, green: 25/255, blue: 92/255, alpha: 1)
            storyClosure?(cellId,bestOffer)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let storyCollCell = collectionView.cellForItem(at: indexPath) as? StoriesCollectionCell{
            storyCollCell.storyImage.layer.borderWidth = 0
            storyCollCell.storyImage.layer.borderColor = UIColor.black.cgColor
            storyCollCell.storyName.textColor = .black
        }
    }
}
