//
//  OffersViewController.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 03/10/23.
//
import UIKit
import NVActivityIndicatorView

class OffersViewController: ParentVC {
    
    //MARK: - Outlets
    @IBOutlet weak var offersTableView : UITableView!
    @IBOutlet weak var loaderView : NVActivityIndicatorView!
    
    //MARK: - Variables
    var prodData : [ProductList] = []
    var bannerData : [Banner] = []
    var apiRunning : Bool = false
    
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
//MARK: - Prepare UI Functins
extension OffersViewController{
    func prepareUI(){
        loadingView(loadView: loaderView)
        loaderView.startAnimating()
        OffersObject.shared.callOffersData(id: 184, completionHandler: {[weak self] prodData,bannerData in
            DispatchQueue.main.async {
                self?.prodData = prodData
                self?.bannerData = bannerData
                self?.offersTableView.delegate = self
                self?.offersTableView.dataSource = self
                self?.offersTableView.reloadData()
                self?.loaderView.stopAnimating()
            }
        })
    }
    func registerXib(){
        offersTableView.register(UINib(nibName: "CustomStoriesCell", bundle: nil), forCellReuseIdentifier: "storiesCell")
        offersTableView.register(UINib(nibName: "CustomSlideBannerCell", bundle: nil), forCellReuseIdentifier: "slideBannerCell")
        offersTableView.register(UINib(nibName: "CustomOfferProductCell", bundle: nil), forCellReuseIdentifier: "prodCell")
    }
}

//MARK: - SideMenu Action and DisplayStory Function
extension OffersViewController{

    func displayStory(){
        let storyboard = UIStoryboard(name: "Offers", bundle: nil)
        if let displayStoryVC = storyboard.instantiateViewController(identifier: "DisplayStoryViewController") as? DisplayStoryViewController{
            navigationController?.pushViewController(displayStoryVC, animated: true)
        }
    }
    func callAPIFromStory(value : String){
        if let cellValueId = Int(value){
            loaderView.startAnimating()
            if apiRunning == false{
                apiRunning = true
                OffersObject.shared.callOffersData(id: cellValueId, completionHandler: {[weak self] prodData,bannerData in
                    DispatchQueue.main.async {
                        self?.prodData = prodData
                        self?.bannerData = bannerData
                        self?.offersTableView.reloadData()
                        self?.loaderView.stopAnimating()
                    }
                })
                apiRunning = false
            }
        }
    }
}
