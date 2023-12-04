//
//  CalenderViewController.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 19/10/23.
//

import UIKit

class CalenderViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var dateCollectionView : UICollectionView!
    @IBOutlet weak var doneButton : UIButton!
    @IBOutlet weak var dayNightSegment : UISegmentedControl!
    @IBOutlet var timeButton : [UIButton]!
    @IBOutlet weak var backView : UIView!
    //MARK: - Variables
    var doneClosure : ((Bool) -> ())?
    var dataArray : [CalenderTime] = []
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addAnimation()
        self.prepareUI()
        self.registerXib()
    }
}
//MARK: - Prepare UI Functions
extension CalenderViewController{
    func prepareUI(){
        dataArray = CartObject.shared.calenderObject()
        dateCollectionView.delegate = self
        dateCollectionView.dataSource = self
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        doneButton.layer.cornerRadius = 5
        dayNightSegment.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        dayNightSegment.setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .normal)
        for items in timeButton{
            items.layer.cornerRadius = 5
            items.layer.borderWidth = 0.5
            items.layer.borderColor = UIColor(red: 10/255, green: 25/255, blue: 92/255, alpha: 1).cgColor
        }
    }
    func addAnimation(){
        self.backView.transform = CGAffineTransform(translationX: 0, y: self.backView.frame.size.height)
        UIView.animate(withDuration: 0.4) {
            self.backView.transform = .identity
        }
    }
    func registerXib(){
        dateCollectionView.register(UINib(nibName: "CustomCalenderTimeCell", bundle: nil), forCellWithReuseIdentifier: "calenderTimeCell")
    }
}
//MARK: - Button Actions
extension CalenderViewController{
    @IBAction func closeButton(_ sender : UIButton){
        self.backView.transform = .identity
        UIView.animate(withDuration: 0.4, animations: {
            self.backView.transform = CGAffineTransform(translationX: 0, y: self.backView.frame.size.height)
        }){ _ in
            self.view.removeFromSuperview()
        }
        doneClosure?(false)
    }
    @IBAction func doneButton(_ sender : UIButton){
        self.backView.transform = .identity
        UIView.animate(withDuration: 0.4, animations: {
            self.backView.transform = CGAffineTransform(translationX: 0, y: self.backView.frame.size.height)
        }){ _ in
            self.view.removeFromSuperview()
        }
        doneClosure?(true)
    }
    @IBAction func timeButtonTap(_ sender : UIButton){
        for items in timeButton{
            if items == sender{
                items.backgroundColor = UIColor(red: 10/255, green: 25/255, blue: 92/255, alpha: 1)
                items.setTitleColor(.white, for: .normal)
            }
            else{
                items.backgroundColor = .white
                items.setTitleColor(UIColor(red: 153/255, green: 160/255, blue: 176/255, alpha: 1), for: .normal)
            }
        }
    }
}
//MARK: -  Collection View Functions
extension CalenderViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let calenderTimeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "calenderTimeCell", for: indexPath) as! CustomCalenderTimeCell
        calenderTimeCell.setUpDateData(data: dataArray[indexPath.row])
        calenderTimeCell.backView.backgroundColor = .white
        calenderTimeCell.dayLabel.textColor = UIColor(red: 153/255, green: 160/255, blue: 176/255, alpha: 1)
        calenderTimeCell.dateLabel.textColor = UIColor(red: 153/255, green: 160/255, blue: 176/255, alpha: 1)
        return calenderTimeCell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width/4) - 20, height: (collectionView.frame.size.width/4.5) - 15)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let calenderCell = collectionView.cellForItem(at: indexPath) as? CustomCalenderTimeCell{
            calenderCell.backView.backgroundColor = UIColor(red: 10/255, green: 25/255, blue: 92/255, alpha: 1)
            calenderCell.dayLabel.textColor = .white
            calenderCell.dateLabel.textColor = .white
        }
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let calenderCell = collectionView.cellForItem(at: indexPath) as? CustomCalenderTimeCell{
            calenderCell.backView.backgroundColor = .white
            calenderCell.dayLabel.textColor = UIColor(red: 153/255, green: 160/255, blue: 176/255, alpha: 1)
            calenderCell.dateLabel.textColor = UIColor(red: 153/255, green: 160/255, blue: 176/255, alpha: 1)
        }
    }
}
