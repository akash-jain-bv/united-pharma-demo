//
//  StoryPageViewController.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 03/10/23.
//

import UIKit
import CHIPageControl

class DisplayStoryViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var storyCollectionView : UICollectionView!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var buyNowButton : UIButton!
    @IBOutlet weak var pageControl : CHIPageControlJaloro!
    //MARK: - Variables
    var dataArray : [DisplayStoryData] = []
    var currentCellIndex = 0
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareUI()
        self.registerXib()
    }
}
//MARK: - Prepare UI Function
extension DisplayStoryViewController{
    func prepareUI(){
        dataArray = OffersObject.shared.displayStoryObject()
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar .isHidden = true
        self.pageControl.numberOfPages = dataArray.count
        pageControl.tintColor = .gray
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
        addToCartButton.layer.cornerRadius = 10
        buyNowButton.layer.cornerRadius = 10
    }
    func registerXib(){
        storyCollectionView.register(UINib(nibName: "DisplayCollCell", bundle: nil), forCellWithReuseIdentifier: "displayStoryCell")
    }
}
//MARK: - Collection View Function
extension DisplayStoryViewController :UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let displayStoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "displayStoryCell", for: indexPath) as! DisplayCollCell
        displayStoryCell.setUpDisplayStory(storyData: dataArray[indexPath.row])
        displayStoryCell.closeClosure = {[weak self]  in
            self?.navigationController?.popViewController(animated: true)
        }
        displayStoryCell.swipeClosure = {[weak self] swipe in
            if swipe == "right"{
                self?.storyCollectionView.scrollToItem(at: [0,self!.currentCellIndex + 1], at: .right, animated: true)
                self?.currentCellIndex += 1
            }
            else{
                self?.storyCollectionView.scrollToItem(at: [0,self!.currentCellIndex - 1], at: .right, animated: true)
                self?.currentCellIndex -= 1
            }
            self?.pageControl.set(progress: self!.currentCellIndex, animated: true)
        }
        return displayStoryCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width), height: (collectionView.frame.size.height))
    }
}
//MARK: - Alert On Button Action
extension DisplayStoryViewController{
    @IBAction func addToCartClicked(_ sender : UIButton){
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        let displayMsg =  UIAlertAction(title: "Product added to your cart", style: .default, handler: nil)
        displayMsg.setValue(UIImage(named: "shopping-cart"), forKey: "image")
        alert.addAction(displayMsg)
        alert.view.tintColor = .black
        self.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2){
            alert.dismiss(animated: true, completion: nil)
        }
    }
}
