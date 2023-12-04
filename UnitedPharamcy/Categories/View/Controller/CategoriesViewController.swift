//
//  CategoriesViewController.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 26/09/23.
//

import UIKit
import NVActivityIndicatorView

class CategoriesViewController: ParentVC {
    
    //MARK: - Outlet
    @IBOutlet weak var categoriesTableView : UITableView!
    @IBOutlet weak var loaderView : NVActivityIndicatorView!
    
    //MARK: - Variables
    var categoriesBannerArray : [CategoryBanner] = []
    var categoriesDropDataArray : [[CategoryDatum]] = []
    var dropDownDataTblOneArray : [CategoryDrop] = []
    var dropDownDataTblTwoArray : [CategoryDrop] = []
    var heightForCL = 210
    var tblTwoDropped : Bool = false
    var indexValueForTbl = 0
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareUI()
        self.registerXib()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        tabBarController?.tabBar .isHidden = false
        tabBarController?.tabBar.isTranslucent = false
    }
}
//MARK: - Prepare UI Function and Gesture Function
extension CategoriesViewController{
    func prepareUI(){
        loadingView(loadView: loaderView)
        loaderView.startAnimating()
        APIManager.shared.categoriesTypeData(completionHandler: {[weak self] categoriesDropData,categoriesBannerData in
            self?.categoriesDropDataArray = categoriesDropData.chunk(into: 3)
            self?.categoriesBannerArray = categoriesBannerData
            self?.categoriesTableView.reloadData()
            self?.loaderView.stopAnimating()
        })
        categoriesTableView.delegate = self
        categoriesTableView.dataSource = self
    }
    
    func registerXib(){
        categoriesTableView.register(UINib(nibName: "CustomSlideLabelCell", bundle: nil), forCellReuseIdentifier: "slideLabelCell")
        categoriesTableView.register(UINib(nibName: "CustomBannerCell", bundle: nil), forCellReuseIdentifier: "bannerCell")
        categoriesTableView.register(UINib(nibName: "dropDownTableViewCell", bundle: nil), forCellReuseIdentifier: "dropDownTBLCell")
    }
    //Header One Tap
    @objc func handleTap(_ sender: UIButton) {
        loaderView.startAnimating()
        self.dropDownDataTblTwoArray = APIManager.shared.dropDownDataTblTwoArray
        self.categoriesTableView.reloadSections([2,0], with: .none)
        APIManager.shared.dropDownTapForFirst(btnTag: sender.tag, completionHandler: {[weak self] dropDownData in
            self?.dropDownDataTblOneArray = dropDownData
            self?.categoriesTableView.reloadSections(IndexSet(integer: 1), with: .none)
            self?.loaderView.stopAnimating()
        })
    }
    //Header Two Tap
    @objc func handleTapTwo(_ sender: UIButton) {
        loaderView.startAnimating()
        self.dropDownDataTblOneArray = APIManager.shared.dropDownDataTblOneArray
        self.categoriesTableView.reloadSections([1,0], with: .none)
        APIManager.shared.dropDownTapForSecond(btnTag: sender.tag, completionHandler: {[weak self] dropDownData in
            self?.dropDownDataTblTwoArray = dropDownData
            self?.categoriesTableView.reloadSections(IndexSet(integer: 2), with: .none)
            self?.loaderView.stopAnimating()
        })
    }
}

