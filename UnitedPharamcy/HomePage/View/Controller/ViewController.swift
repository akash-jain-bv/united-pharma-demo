//
//  ViewController.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 20/09/23.
//

import UIKit
import NVActivityIndicatorView

class ViewController: ParentVC {
    //MARK: - Outlets
    @IBOutlet weak var homePageTableView : UITableView!
    @IBOutlet weak var searchBarTF : UITextField!
    @IBOutlet weak var loaderView : NVActivityIndicatorView!
    //MARK: - Variable
    var cellSortArray : [SortOrder] = []
    var cellBrandArray : [ShopByBrand] = []
    var cellBannerArray : [Banner] = []
    var cellCategoryArray : [FeaturedCategory] = []
    var ourServices : [Banner] = []
    var topSelling : [ProductList] = []
    var mostViewed : [ProductList] = []
    var chosenForYou : [ProductList] = []
    var discount : [Banner] = []
    var discountBanner : [Banner] = []
    var slideBanner : [Banner] = []
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareUI()
        self.searchTextField() 
        self.registerXib()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        tabBarController?.tabBar .isHidden = false
        tabBarController?.tabBar.isTranslucent = false
    }
}
//MARK: - Prepare UI Functions
extension ViewController{
    func prepareUI(){
        loadingView(loadView: loaderView)
        loaderView.startAnimating()
        CellData.shared.getApiData(completionHandler: { [weak self] (cellBannerArray,cellCategoryArray,ourServices,cellBrandArray,discount,topSelling,discountBanner,mostViewed,slideBanner,chosenForYou,cellSortArray) in
            DispatchQueue.main.async {
                self?.cellBrandArray = cellBrandArray
                self?.cellBannerArray = cellBannerArray
                self?.cellCategoryArray = cellCategoryArray
                self?.ourServices = ourServices
                self?.topSelling = topSelling
                self?.mostViewed = mostViewed
                self?.chosenForYou = chosenForYou
                self?.discount = discount
                self?.discountBanner = discountBanner
                self?.slideBanner = slideBanner
                self?.cellSortArray = cellSortArray
                self?.homePageTableView.reloadData()
                self?.loaderView.stopAnimating()
            }
        })
        homePageTableView.delegate = self
        homePageTableView.dataSource = self
        searchBarTF.layer.cornerRadius = 10
        searchBarTF.layer.masksToBounds = true
    }
    func searchTextField(){
        let imageIcon = UIImageView()
        imageIcon.image = UIImage(named: "search")
        let contentView = UIView()
        contentView.addSubview(imageIcon)
        contentView.frame = CGRect(x: 0, y: 0, width: UIImage(named: "search")!.size.width, height: UIImage(named: "search")!.size.height)
        imageIcon.frame = CGRect(x: 5, y: 0, width: UIImage(named: "search")!.size.width, height: UIImage(named: "search")!.size.height)
        searchBarTF.leftView = contentView
        searchBarTF.leftViewMode = .always
    }
    func registerXib(){
        homePageTableView.register(UINib(nibName: "CustomFirstCell", bundle: nil), forCellReuseIdentifier: "firstCell")
        homePageTableView.register(UINib(nibName: "CustomSecondCell", bundle: nil), forCellReuseIdentifier: "secondCell")
        homePageTableView.register(UINib(nibName: "CustomPrescriptionCell", bundle: nil), forCellReuseIdentifier: "prescriptionCell")
        homePageTableView.register(UINib(nibName: "ShopByCategoryCell", bundle: nil), forCellReuseIdentifier: "shopTableCell")
        homePageTableView.register(UINib(nibName: "ServicesCustomCell", bundle: nil), forCellReuseIdentifier: "servicesCell")
        homePageTableView.register(UINib(nibName: "CustomShopByBrandCell", bundle: nil), forCellReuseIdentifier: "brandCell")
        homePageTableView.register(UINib(nibName: "CustomDiscountCell", bundle: nil), forCellReuseIdentifier: "discountCell")
        homePageTableView.register(UINib(nibName: "CustomTopSellingCell", bundle: nil), forCellReuseIdentifier: "topSellingCell")
        homePageTableView.register(UINib(nibName: "CustomDiscountBarCell", bundle: nil), forCellReuseIdentifier: "discountBarCell")
        homePageTableView.register(UINib(nibName: "CustomMostViewedCell", bundle: nil), forCellReuseIdentifier: "mostViewedCell")
        homePageTableView.register(UINib(nibName: "CustomSlideBarCell", bundle: nil), forCellReuseIdentifier: "slideBarCell")
        homePageTableView.register(UINib(nibName: "CustomChosenForYouCell", bundle: nil), forCellReuseIdentifier: "chosenForYouCell")
        
    }
}
