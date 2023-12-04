//
//  ChangeStoreViewController.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 20/10/23.
//

import UIKit

class ChangeStoreViewController: ParentVC {
    //MARK: - Outlets
    @IBOutlet weak var searchLocationTF : UITextField!
    @IBOutlet weak var storeAddressTableView : UITableView!
    @IBOutlet weak var continueBtn : UIButton!
    @IBOutlet weak var continueBtnView : UIView!
    @IBOutlet weak var qrButton : UIButton!
    //MARK: - Variables
    var dataArray : [StoreAddress] = []
    var isListView : Bool = true
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareUI()
        self.registerXib()
        self.searchTextField()
    }
}
//MARK: - Prepare UI Functions
extension ChangeStoreViewController{
    func prepareUI(){
        dataArray = StoreObject.shared.storeAddressObject()
        storeAddressTableView.delegate = self
        storeAddressTableView.dataSource = self
        continueBtn.layer.cornerRadius = 5
    }
    func registerXib(){
        storeAddressTableView.register(UINib(nibName: "CustomAddressCell", bundle: nil), forCellReuseIdentifier: "addressCell")
        storeAddressTableView.register(UINib(nibName: "CustomMapViewCell", bundle: nil), forCellReuseIdentifier: "storeMapCell")
    }
    func searchTextField(){
        let imageIcon = UIImageView()
        imageIcon.image = UIImage(named: "search")
        let contentView = UIView()
        contentView.addSubview(imageIcon)
        contentView.frame = CGRect(x: 0, y: 0, width: UIImage(named: "search")!.size.width, height: UIImage(named: "search")!.size.height)
        imageIcon.frame = CGRect(x: 5, y: 0, width: UIImage(named: "search")!.size.width, height: UIImage(named: "search")!.size.height)
        searchLocationTF.leftView = contentView
        searchLocationTF.leftViewMode = .always
    }
}
//MARK: - Button Actions
extension ChangeStoreViewController{
    @IBAction func mapViewClicked(_ sender: UIButton) {
        if sender.currentTitle == "Map View"{
            sender.setTitle("List View", for: .normal)
            isListView = false
        }
        else{
            sender.setTitle("Map View", for: .normal)
            isListView = true
        }
        storeAddressTableView.reloadData()
        
    }
    @IBAction func qrCodeClicked(_ sender: UIButton) {
        if let qrCodeVC = self.storyboard?.instantiateViewController(identifier: "QRCodeViewController") as? QRCodeViewController{
            navigationController?.pushViewController(qrCodeVC, animated: true)
        }
    }
    func changeValueOfUI(value : Bool){
        self.continueBtnView.isHidden = !value
        self.qrButton.isHidden = !value
        self.storeAddressTableView.isScrollEnabled = value
    }
}
