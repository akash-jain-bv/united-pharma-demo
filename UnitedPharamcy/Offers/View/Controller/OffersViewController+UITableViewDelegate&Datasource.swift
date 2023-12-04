//
//  OffersViewController+UITableViewDelegate&Datasource.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 13/10/23.
//
import UIKit

//MARK: - TableView Functions
extension OffersViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return offersCellRegistration.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch offersCellRegistration(rawValue: indexPath.row) {
        case .storiesCell:
            let storiesCell = tableView.dequeueReusableCell(withIdentifier: "storiesCell", for: indexPath) as! CustomStoriesCell
            storiesCell.storyClosure = {[weak self] cellId,bestOffer in
                if bestOffer == "1"{
                    self?.displayStory()
                }
                self?.callAPIFromStory(value: cellId)
            }
            return storiesCell
        case .slideLabelCell:
            let slideBannerCell = tableView.dequeueReusableCell(withIdentifier: "slideBannerCell", for: indexPath) as! CustomSlideBannerCell
            slideBannerCell.pageControl.numberOfPages = bannerData.count
            slideBannerCell.dataArray = bannerData
            slideBannerCell.slideBannerCollectionView.reloadData()
            return slideBannerCell
        case .productCell:
            let prodCell = tableView.dequeueReusableCell(withIdentifier: "prodCell", for: indexPath) as! CustomOfferProductCell
            prodCell.dataArray = prodData
            prodCell.productCollectionView.reloadData()
            return prodCell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch offersCellRegistration(rawValue: indexPath.row) {
        case .storiesCell :
            return (tableView.frame.size.width / 3.5)//120
        case .slideLabelCell :
            return (tableView.frame.size.width / 2)
        case .productCell :
            if prodData.count != 0{
                if prodData.count % 2 == 0{
                   return 300 * CGFloat(prodData.count / 2)
               }
               return 300 * CGFloat((prodData.count + 1) / 2)
            }
            return UITableView.automaticDimension
        default:
            return UITableView.automaticDimension
        }
    }
}
