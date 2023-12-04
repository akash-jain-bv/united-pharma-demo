//
//  CustomSlideBannerCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 06/10/23.
//

import UIKit
import CHIPageControl

class CustomSlideBannerCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var slideBannerCollectionView : UICollectionView!
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

//MARK: - Setup UI Function
extension CustomSlideBannerCell{
    func setupUI(){
        timer = nil
        timer?.invalidate()
        self.pageControl.numberOfPages = dataArray.count
        pageControl.tintColor = .gray
        self.slideBannerCollectionView.delegate = self
        self.slideBannerCollectionView.dataSource = self
        self.timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.slideToNext), userInfo: nil, repeats: true)
    }
    
    func registerXib(){
        self.slideBannerCollectionView.register(UINib(nibName: "SlideBarCollectionCell", bundle: nil), forCellWithReuseIdentifier: "slideBarCollectionCell")
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
            self.slideBannerCollectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .right, animated: true)
        }
    }
}
//MARK: - CollectionView Function
extension CustomSlideBannerCell : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let slideLabelCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "slideBarCollectionCell", for: indexPath) as! SlideBarCollectionCell
        slideLabelCollectionCell.setUpOfferSlideLabelData(productData: dataArray[indexPath.row])
        return slideLabelCollectionCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width), height: (collectionView.frame.size.height))
    }
}
