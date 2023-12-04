//
//  HomeDeliveryViewController.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 19/10/23.
//

import UIKit

class HomeDeliveryViewController: ParentVC {
    //MARK: - Outlets
    @IBOutlet weak var homeDeliveryTableView : UITableView!
    @IBOutlet weak var continueBtn : UIButton!
    //MARK: - Variables
    var dataArray : [DeliveryAddress] = []
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareUI()
        self.registerXib()
    }
}
//MARK: - Prepare UI Functions
extension HomeDeliveryViewController{
    func prepareUI(){
        tabBarController?.tabBar.isHidden = true
        dataArray = AddressObject.shared.addressObject()
        homeDeliveryTableView.delegate = self
        homeDeliveryTableView.dataSource = self
        continueBtn.layer.cornerRadius = 10
    }
    func registerXib(){
        homeDeliveryTableView.register(UINib(nibName: "CustomAddressCell", bundle: nil), forCellReuseIdentifier: "addressCell")
    }
}
//MARK: - TableView Functions
extension HomeDeliveryViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let addressCell = tableView.dequeueReusableCell(withIdentifier: "addressCell", for: indexPath) as! CustomAddressCell
        addressCell.selectionStyle = .none
        addressCell.setUpAddressData(data: dataArray[indexPath.row])
        return addressCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let addressCell = tableView.cellForRow(at: indexPath) as? CustomAddressCell{
            addressCell.backView.backgroundColor = UIColor(red: 239/255, green: 249/255, blue: 255/255, alpha: 1)
            addressCell.selectedAddImage.image = UIImage(named:  "selectRB_ic")
        }
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let addressCell = tableView.cellForRow(at: indexPath) as? CustomAddressCell{
            addressCell.backView.backgroundColor = .white
            addressCell.selectedAddImage.image = UIImage(named:  "unselectRB_ic")
        }
    }
}
//MARK: - Button Actions
extension HomeDeliveryViewController{
    @IBAction func addNewAddress(_ sender: UIButton) {
        if let addNewAddressVC = self.storyboard?.instantiateViewController(identifier: "AddNewAddressViewController") as? AddNewAddressViewController{
            navigationController?.pushViewController(addNewAddressVC, animated: true)
        }
    }
}
