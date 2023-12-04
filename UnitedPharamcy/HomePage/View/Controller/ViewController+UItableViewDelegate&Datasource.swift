//
//  ViewController+UItableViewDelegate&Datasource.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 16/10/23.
//
import UIKit
//MARK: - TableView Functions
extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellSortArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cellRegistration = cellSortArray[indexPath.row].position{
            switch HomePageCell(rawValue: cellRegistration){
            case .firstCell:
                let firstCell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath) as! CustomFirstCell
                return firstCell
            case .secondCell:
                let secondCell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath) as! CustomSecondCell
                secondCell.pageControl.numberOfPages = cellBannerArray.count
                secondCell.dataArray = cellBannerArray
                return secondCell
            case .prescriptionCell:
                let prescriptionCell = tableView.dequeueReusableCell(withIdentifier: "prescriptionCell", for: indexPath) as! CustomPrescriptionCell
                return prescriptionCell
            case .shopTableCell:
                let shopTableCell = tableView.dequeueReusableCell(withIdentifier: "shopTableCell", for: indexPath) as! ShopByCategoryCell
                shopTableCell.dataArray = cellCategoryArray
                shopTableCell.viewAllClosure = {[weak self] value in
                    if value{
                        self?.redirectToAllProduct()
                    }
                }
                return shopTableCell
            case .servicesCell:
                let servicesCell = tableView.dequeueReusableCell(withIdentifier: "servicesCell", for: indexPath) as! ServicesCustomCell
                servicesCell.dataArray = ourServices
                return servicesCell
            case .brandCell:
                let brandCell = tableView.dequeueReusableCell(withIdentifier: "brandCell", for: indexPath) as! CustomShopByBrandCell
                brandCell.dataArray = cellBrandArray
                brandCell.viewAllClosure = {[weak self] value in
                    if value{
                        self?.redirectToAllProduct()
                    }
                }
                return brandCell
            case .discountCell:
                let discountCell = tableView.dequeueReusableCell(withIdentifier: "discountCell", for: indexPath) as! CustomDiscountCell
                discountCell.dataArray = discount
                return discountCell
            case .topSellingCell:
                let topSellingCell = tableView.dequeueReusableCell(withIdentifier: "topSellingCell", for: indexPath) as! CustomTopSellingCell
                topSellingCell.dataArray = topSelling
                topSellingCell.closure = {[weak self] prodValue in
                    self?.redirectToProdVC(aboutProd: prodValue)
                }
                topSellingCell.viewAllClosure = {[weak self] value in
                    if value{
                        self?.redirectToAllProduct()
                    }
                }
                return topSellingCell
            case .discountBarCell:
                let discountBarCell = tableView.dequeueReusableCell(withIdentifier: "discountBarCell", for: indexPath) as! CustomDiscountBarCell
                discountBarCell.dataArray = discountBanner
                return discountBarCell
            case .mostViewedCell:
                let mostViewedCell = tableView.dequeueReusableCell(withIdentifier: "mostViewedCell", for: indexPath) as! CustomMostViewedCell
                mostViewedCell.closure = {[weak self] prodValue in
                    self?.redirectToProdVC(aboutProd: prodValue)
                }
                mostViewedCell.dataArray = mostViewed
                return mostViewedCell
            case .slideBarCell:
                let slideBarCell = tableView.dequeueReusableCell(withIdentifier: "slideBarCell", for: indexPath) as! CustomSlideBarCell
                slideBarCell.dataArray = slideBanner
                slideBarCell.pageControl.numberOfPages = slideBanner.count
                return slideBarCell
            case .chosenForYouCell:
                let chosenForYouCell = tableView.dequeueReusableCell(withIdentifier: "chosenForYouCell", for: indexPath) as! CustomChosenForYouCell
                chosenForYouCell.dataArray = chosenForYou
                chosenForYouCell.closure = {[weak self] prodValue in
                    self?.redirectToProdVC(aboutProd: prodValue)
                }
                chosenForYouCell.viewAllClosure = {[weak self] value in
                    if value{
                        self?.redirectToAllProduct()
                    }
                }
                return chosenForYouCell
            default:
                return UITableViewCell()
            }
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let cellRegistration = cellSortArray[indexPath.row].position{
            switch HomePageCell(rawValue: cellRegistration){
            case .firstCell:
                return (tableView.frame.size.width / 9)//50
            case .secondCell:
                return (tableView.frame.size.width / 2)//220
            case .prescriptionCell:
                return 140
            case .shopTableCell:
                return 300
            case .servicesCell:
                return (133.33 * CGFloat(ourServices.count)) + 40// 440
            case .brandCell:
                return 180
            case .discountCell:
                if discount.count % 2 == 0{
                    return ((tableView.frame.size.width / 2) * CGFloat(Double(discount.count) / 2))
                }
                return ((tableView.frame.size.width / 2) * CGFloat(Double(discount.count) / 1.5))//420
            case .topSellingCell:
                if topSelling.count % 2 == 0{
                    return ((tableView.frame.size.width / 2) * CGFloat(Double(topSelling.count) / 2))
                }
                return ((tableView.frame.size.width / 2) * CGFloat(Double(topSelling.count) / 1.5))//450
            case .discountBarCell:
                return ((tableView.frame.size.width / 3.5) * CGFloat(discountBanner.count)) + 20//280
            case .mostViewedCell:
                if mostViewed.count % 2 == 0{
                    return ((tableView.frame.size.width / 2) * CGFloat(Double(mostViewed.count) / 2))
                }
                return ((tableView.frame.size.width / 2) * CGFloat(Double(mostViewed.count) / 1.5))//420
            case .slideBarCell:
                if slideBanner.count != 0{
                    return (tableView.frame.size.width / 3.5)
                }
                return UITableView.automaticDimension
            case .chosenForYouCell:
                if chosenForYou.count % 2 == 0{
                    return ((tableView.frame.size.width / 2) * CGFloat(Double(chosenForYou.count) / 2))
                }
                return ((tableView.frame.size.width / 2) * CGFloat(Double(chosenForYou.count) / 1.5))//450
            default:
                return UITableView.automaticDimension
            }
        }
        return UITableView.automaticDimension
    }
}
