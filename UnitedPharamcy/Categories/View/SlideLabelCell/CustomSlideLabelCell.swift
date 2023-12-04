//
//  CustomSlideLabelCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 26/09/23.
//

import UIKit
import CHIPageControl

class CustomSlideLabelCell: UITableViewCell{
    //MARK: - Outlets
    @IBOutlet weak var slideLabelCollectionView : UICollectionView!
    @IBOutlet weak var pageControl : CHIPageControlPaprika!
    //MARK: - Variables
    var dataArray : [CategoryBanner] = []
    var timer : Timer?
    var currentCellIndex = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
        self.registerXib()
    }
}
//MARK: - Setup UI Function
extension CustomSlideLabelCell{
    func setupUI(){
        timer = nil
        timer?.invalidate()
        self.pageControl.numberOfPages = dataArray.count
        pageControl.tintColor = .gray
        self.slideLabelCollectionView.delegate = self
        self.slideLabelCollectionView.dataSource = self
        self.timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.slideToNext), userInfo: nil, repeats: true)
    }
    
    func registerXib(){
        self.slideLabelCollectionView.register(UINib(nibName: "SlideBarCollectionCell", bundle: nil), forCellWithReuseIdentifier: "slideBarCollectionCell")
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
            self.slideLabelCollectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .right, animated: true)
        }
    }
}
//MARK: - CollectionView Function
extension CustomSlideLabelCell : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let slideLabelCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "slideBarCollectionCell", for: indexPath) as! SlideBarCollectionCell
        slideLabelCollectionCell.setUpCatgSlideLabelData(productData: dataArray[indexPath.row])
        return slideLabelCollectionCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width), height: (collectionView.frame.size.height))
    }
}
