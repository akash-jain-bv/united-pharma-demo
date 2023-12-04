//
//  ChangeStoreViewController+TableViewFunctions.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 31/10/23.
//

import UIKit
//MARK: - TableView Functions
extension ChangeStoreViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch isListView{
        case true:
            return dataArray.count
        case false:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch isListView {
        case true:
            self.changeValueOfUI(value: isListView)
            let addressCell = tableView.dequeueReusableCell(withIdentifier: "addressCell", for: indexPath) as! CustomAddressCell
            addressCell.selectionStyle = .none
            addressCell.setUpStoreData(data: dataArray[indexPath.row])
            return addressCell
        case false:
            self.changeValueOfUI(value: isListView)
            let storeMapCell = tableView.dequeueReusableCell(withIdentifier: "storeMapCell", for: indexPath) as! CustomMapViewCell
            storeMapCell.selectionStyle = .none
            return storeMapCell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch isListView {
        case true:
            return 120
        case false:
            return tableView.frame.size.height
        }
       
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
