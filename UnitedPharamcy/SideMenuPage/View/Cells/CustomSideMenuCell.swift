//
//  CustomSideMenuCell.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 21/09/23.
//

import UIKit

class CustomSideMenuCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var iconImage : UIImageView!
    @IBOutlet weak var viewInBack : UIView!
    @IBOutlet weak var descriptionLabel : UILabel!
    @IBOutlet weak var dropDownTableView : UITableView!
    //MARK: - Variables
    var dataArray : [DropDown] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        viewInBack.layer.cornerRadius = 10
        self.setupUI()
    }
}
//MARK: - SetupUI Function
extension CustomSideMenuCell{
    func setUpSideMenuData(data : SideMenu){
        iconImage.image = UIImage(named: data.icon)
        descriptionLabel.text = data.labelDescription
    }
    func setupUI(){
        dataArray = setUpSideMenuObject().dropDownObject()
        dropDownTableView.delegate = self
        dropDownTableView.dataSource = self
        dropDownTableView.layer.cornerRadius = 10
        dropDownTableView.isHidden = true
        dropDownTableView.register(UINib(nibName: "CustomDropDownCell", bundle: nil), forCellReuseIdentifier: "dropDownCell")
        dropDownTableView.sectionHeaderHeight = 5.0;
        dropDownTableView.sectionFooterHeight = 1.0;
    }
}
//MARK: - Collection View Function
extension CustomSideMenuCell : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dropDownCell = tableView.dequeueReusableCell(withIdentifier: "dropDownCell", for: indexPath) as! CustomDropDownCell
        dropDownCell.layer.borderWidth =  0.2
        dropDownCell.layer.cornerRadius = 10
        dropDownCell.setUpdropDownData(data: dataArray[indexPath.section])
        return dropDownCell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
}
