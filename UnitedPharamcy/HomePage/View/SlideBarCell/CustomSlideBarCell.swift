//
//  CustomSlideBarCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 21/09/23.
//

import UIKit
import CHIPageControl

class CustomSlideBarCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var slideBarCollectionCell : UICollectionView!
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
extension CustomSlideBarCell{
    func setupUI(){
        slideBarCollectionCell.delegate = self
        slideBarCollectionCell.dataSource = self
        pageControl.tintColor = .gray
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
    }
    func registerXib(){
        slideBarCollectionCell.register(UINib(nibName: "SlideBarCollectionCell", bundle: nil), forCellWithReuseIdentifier: "slideBarCollectionCell")
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
            slideBarCollectionCell.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .right, animated: true)
        }
    }
}
//MARK: - Collection View Function
extension CustomSlideBarCell : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let slideBarCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "slideBarCollectionCell", for: indexPath) as! SlideBarCollectionCell
        slideBarCollectionCell.setUpSlideBarData(productData: dataArray[indexPath.row])
        return slideBarCollectionCell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width) - 10, height: (collectionView.frame.size.width/3) - 20)
    }
}
