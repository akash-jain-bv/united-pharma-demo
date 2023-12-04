//
//  QRCodeViewController.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 20/10/23.
//

import UIKit

class QRCodeViewController: ParentVC {
    //MARK: - Outlets
    @IBOutlet weak var qrCodeCollectionView: UICollectionView!
    @IBOutlet weak var qrCodeSegment : UISegmentedControl!
    //MARK: - Variables
    var isQRCode : Bool = true
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareUI()
        self.registerXib()
    }
}
//MARK: - Prepare UI Functions
extension QRCodeViewController{
    func prepareUI(){
        qrCodeCollectionView.delegate = self
        qrCodeCollectionView.dataSource = self
        qrCodeSegment.setTitleTextAttributes([.foregroundColor: UIColor(red: 10/255, green: 25/255, blue: 92/255, alpha: 1)], for: .selected)
        qrCodeSegment.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        qrCodeSegment.layer.borderColor = UIColor.white.cgColor
        qrCodeSegment.layer.borderWidth = 1
        
    }
    func registerXib(){
        qrCodeCollectionView.register(UINib(nibName: "CustomQRCodeCell", bundle: nil), forCellWithReuseIdentifier: "qrCodeCell")
        qrCodeCollectionView.register(UINib(nibName: "CustomManualCodeCell", bundle: nil), forCellWithReuseIdentifier: "manualCodeCell")
    }
}
//MARK: - CollectionView Functions
extension QRCodeViewController : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch isQRCode {
        case true:
            let qrCodeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "qrCodeCell", for: indexPath) as! CustomQRCodeCell
            return qrCodeCell
        case false:
            let manualCodeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "manualCodeCell", for: indexPath) as! CustomManualCodeCell
            return manualCodeCell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width), height: (collectionView.frame.size.height))
    }
    
}
//MARK: - Button Actions
extension QRCodeViewController{
    @IBAction func segmentControl(_ sender : UISegmentedControl){
        let title = sender.titleForSegment(at: sender.selectedSegmentIndex)
        if title == "QR Code Scan"{
            isQRCode = true
        }
        else{
            isQRCode = false
        }
        qrCodeCollectionView.reloadData()
    }
    
}
