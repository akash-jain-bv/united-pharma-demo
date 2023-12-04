//
//  CustomSecondCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 20/09/23.
//

import UIKit
import CHIPageControl

class CustomSecondCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var slideLabelCollectionView : UICollectionView!
    @IBOutlet weak var pageControl : CHIPageControlPaprika!
    //MARK: - Variables
    var dataArray : [Banner] = []
    var timer : Timer?
    var currentCellIndex = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
        self.registerXib()
    }
}
//MARK: - SetupUI Function
extension CustomSecondCell{
    func setupUI(){
        pageControl.tintColor = .gray
        slideLabelCollectionView.delegate = self
        slideLabelCollectionView.dataSource = self
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
    }
    
    func registerXib(){
        slideLabelCollectionView.register(UINib(nibName: "SlideBarCollectionCell", bundle: nil), forCellWithReuseIdentifier: "slideBarCollectionCell")
    }
    
    @objc func slideToNext(){
        if currentCellIndex < dataArray.count - 1{
            currentCellIndex += 1
        }
        else{
            currentCellIndex = 0
        }
        pageControl.set(progress: currentCellIndex, animated: true)
        if dataArray.count != 0{
            slideLabelCollectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .right, animated: true)
        }
    }
}
//MARK: - CollectionView Function
extension CustomSecondCell : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let slideLabelCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "slideBarCollectionCell", for: indexPath) as! SlideBarCollectionCell
        slideLabelCollectionCell.setUpSlideLabelData(productData: dataArray[indexPath.row])
        return slideLabelCollectionCell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width), height: (collectionView.frame.size.height))
    }
}
