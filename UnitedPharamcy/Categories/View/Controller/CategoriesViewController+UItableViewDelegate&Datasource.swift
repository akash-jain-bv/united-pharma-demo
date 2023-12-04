//
//  CategoriesViewController+UItableViewDelegate&Datasource.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 16/10/23.
//
import UIKit
//MARK: - TableView Function
extension CategoriesViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch CategoriesSectionCell(rawValue : section){
        case .bannerCell:
            return dropDownDataTblOneArray.count * 2
        case .bannerCellTwo:
            return dropDownDataTblTwoArray.count * 2
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch CategoriesSectionCell(rawValue : indexPath.section) {
        case .slideLabelCell:
            let slideLabelCell = tableView.dequeueReusableCell(withIdentifier: "slideLabelCell", for: indexPath) as! CustomSlideLabelCell
            slideLabelCell.pageControl.numberOfPages = categoriesBannerArray.count
            slideLabelCell.dataArray = categoriesBannerArray
            slideLabelCell.slideLabelCollectionView.reloadData()
            return slideLabelCell
        case .bannerCell:
            if indexPath.row % 2 == 0{
                let bannerCell = tableView.dequeueReusableCell(withIdentifier: "bannerCell", for: indexPath) as! CustomBannerCell
                bannerCell.setUpDropData(productData: dropDownDataTblOneArray[indexPath.row / 2])
                return bannerCell
            }
            else{
                if tblTwoDropped && indexPath.row == indexValueForTbl{
                    if let dropDownTBLCell = tableView.dequeueReusableCell(withIdentifier: "dropDownTBLCell", for: indexPath) as? DropDownTableViewCell{
                        APIManager.shared.clData(index: indexValueForTbl, completionHandler: {[weak self] clData in
                            dropDownTBLCell.dataArrayCl = clData
                            self?.heightForCL = clData.count
                        })
                        categoriesTableView.reloadRows(at: [indexPath], with: .automatic)
                        dropDownTBLCell.dropDownCollectionView.reloadData()
                        return dropDownTBLCell
                    }
                }
                return UITableViewCell()
            }
        case .bannerCellTwo:
            if indexPath.row % 2 == 0{
                let bannerCell = tableView.dequeueReusableCell(withIdentifier: "bannerCell", for: indexPath) as! CustomBannerCell
                bannerCell.setUpDropData(productData: dropDownDataTblTwoArray[indexPath.row / 2])
                return bannerCell
            }
            else{
                if tblTwoDropped && indexPath.row == indexValueForTbl{
                    if let dropDownTBLCell = tableView.dequeueReusableCell(withIdentifier: "dropDownTBLCell", for: indexPath) as? DropDownTableViewCell{
                        APIManager.shared.clData(index: indexValueForTbl, completionHandler: {[weak self] clData in
                            dropDownTBLCell.dataArrayCl = clData
                            self?.heightForCL = clData.count
                        })
                        categoriesTableView.reloadRows(at: [indexPath], with: .automatic)
                        dropDownTBLCell.dropDownCollectionView.reloadData()
                        return dropDownTBLCell
                    }
                }
                return UITableViewCell()
            }
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch CategoriesSectionCell(rawValue : indexPath.section) {
        case .slideLabelCell :
            return (tableView.frame.size.width / 2)
        case .bannerCell,.bannerCellTwo :
            switch indexPath.row % 2 {
            case 0 :
                return 50
            case 1 :
                if tblTwoDropped && indexPath.row == indexValueForTbl{
                    if heightForCL % 3 == 0{
                        return ((tableView.frame.size.width / 2) * CGFloat(Double(heightForCL) / 3))
                    }
                    else if heightForCL % 2 == 0{
                        return ((tableView.frame.size.width / 2) * CGFloat(Double(heightForCL) / 2))
                    }
                    else{
                        return ((tableView.frame.size.width / 2) * CGFloat(Double(heightForCL + 1) / 3))
                    }
                }
                return 0
            default :
                return UITableView.automaticDimension
            }
        default :
            return UITableView.automaticDimension
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section{
        case 1:
            var firstBtnXValue = 15
            var firstBtnTag = 1
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 400))
            for items in categoriesDropDataArray[section - 1]{
                let headerButton = UIButton(frame: CGRect(x: firstBtnXValue, y: 0, width: (Int(headerView.frame.size.width) / 3) - 15 , height: 160))
                let buttonLabel = UILabel(frame: CGRect(x: 0, y: -15, width: headerButton.frame.size.width, height: headerButton.frame.size.height / 2))
                firstBtnXValue = firstBtnXValue + Int((headerView.frame.size.width) / 3 ) - 5
                guard let imageURL = URL(string: items.mediumMobileImage ?? "") else {
                    return nil
                }
                CallAPI.shared.downloadImage(imageURL: imageURL, completionHandler: {data in
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            headerButton.setImage(image, for: .normal)
                            buttonLabel.text = items.name
                        }
                    }
                })
                buttonLabel.numberOfLines = 0
                buttonLabel.textAlignment = .center
                headerButton.addSubview(buttonLabel)
                headerButton.layer.cornerRadius = 10
                headerButton.tag = firstBtnTag
                firstBtnTag += 1
                headerButton.layer.masksToBounds = true
                headerButton.addTarget(self, action: #selector(self.handleTap(_:)), for: .touchUpInside)
                headerView.addSubview(headerButton)
            }
            return headerView
        case 2:
            var secondBtnXValue = 15
            var secondBtnTag = 4
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 400))
            for items in categoriesDropDataArray[section - 1]{
                let headerButtonOne = UIButton(frame: CGRect(x: secondBtnXValue, y: 0, width: (Int(headerView.frame.size.width) / 3) - 15 , height: 160))
                let buttonLabel = UILabel(frame: CGRect(x: 0, y: -15, width: headerButtonOne.frame.size.width, height: headerButtonOne.frame.size.height / 2))
                secondBtnXValue = secondBtnXValue + Int((headerView.frame.size.width) / 3 ) - 5
                if let imageURL = URL(string: items.mediumMobileImage ?? ""){
                    CallAPI.shared.downloadImage(imageURL: imageURL, completionHandler: {data in
                        if let image = UIImage(data: data) {
                            DispatchQueue.main.async {
                                headerButtonOne.setImage(image, for: .normal)
                                buttonLabel.text = items.name
                            }
                        }
                    })
                    buttonLabel.numberOfLines = 0
                    buttonLabel.textAlignment = .center
                    headerButtonOne.addSubview(buttonLabel)
                    headerButtonOne.layer.cornerRadius = 10
                    headerButtonOne.tag = secondBtnTag
                    secondBtnTag += 1
                    headerButtonOne.layer.masksToBounds = true
                    headerButtonOne.addTarget(self, action: #selector(self.handleTapTwo(_:)), for: .touchUpInside)
                    headerView.addSubview(headerButtonOne)
                }
                else {
                    let image = UIImage(named: "AC_ic")
                    DispatchQueue.main.async {
                        headerButtonOne.setImage(image, for: .normal)
                        headerButtonOne.layer.cornerRadius = 10
                        headerButtonOne.tag = secondBtnTag
                        secondBtnTag += 1
                        headerButtonOne.layer.masksToBounds = true
                        headerButtonOne.addTarget(self, action: #selector(self.handleTapTwo(_:)), for: .touchUpInside)
                        headerView.addSubview(headerButtonOne)
                    }
                }
            }
            return headerView
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch CategoriesSectionCell(rawValue : indexPath.section){
        case .bannerCell,.bannerCellTwo:
            if indexPath.row % 2 == 0{
                let bannerCell = tableView.cellForRow(at: indexPath) as! CustomBannerCell
                if tblTwoDropped == false{
                    tblTwoDropped = true
                    indexValueForTbl = indexPath.row + 1
                    bannerCell.dropDownButton.setImage(UIImage(named: "upButton"), for: .normal)
                }
                else{
                    tblTwoDropped = false
                }
                categoriesTableView.reloadRows(at: [IndexPath(row: indexValueForTbl, section: indexPath.section)], with: .none)
            }
        default:
            return
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        switch CategoriesSectionCell(rawValue : indexPath.section){
        case .bannerCell,.bannerCellTwo:
            if indexPath.row % 2 == 0{
                if let bannerCell = tableView.cellForRow(at: indexPath) as? CustomBannerCell{
                    bannerCell.dropDownButton.setImage(UIImage(named: "arrow-ios-down-outline"), for: .normal)
                }
            }
        default:
            return
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return categoriesDropDataArray.count + 1
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 || section == 2{
            return 160
        }
        return UITableView.automaticDimension
    }
}
