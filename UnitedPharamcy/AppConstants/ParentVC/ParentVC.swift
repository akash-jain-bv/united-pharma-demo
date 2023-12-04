//
//  ParentVC.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 31/10/23.
//

import UIKit
import SideMenu
import NVActivityIndicatorView

class ParentVC: UIViewController {
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
//MARK: - Navigation and Button Actions
extension ParentVC{
    @IBAction func sideMenuButton() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let menu = storyboard.instantiateViewController(withIdentifier: "SideMenuViewController") as? SideMenuViewController{
            let leftMenuNavigationController = SideMenuNavigationController(rootViewController: menu)
            SideMenuManager.default.leftMenuNavigationController = leftMenuNavigationController
            SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: self.navigationController!.view,forMenu: .left)
            SideMenuManager.default.addPanGestureToPresent(toView: self.navigationController!.navigationBar)
            present(leftMenuNavigationController, animated: true, completion: nil)
        }
    }
    
    @IBAction func cartPage(_ sender : UIBarButtonItem){
        let storyBoard = UIStoryboard(name: "Cart", bundle: nil)
        if let cartVC = storyBoard.instantiateViewController(identifier: "CartViewController") as? CartViewController{
            navigationController?.pushViewController(cartVC, animated: true)
        }
    }
    
    @IBAction func returnPage(_ sender : UIBarButtonItem){
        navigationController?.popViewController(animated: true)
    }
    
    func redirectToProdVC(aboutProd : [String:String]){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let prodVC = storyboard.instantiateViewController(identifier: "ProductDetailViewController") as? ProductDetailViewController{
            prodVC.aboutProduct = aboutProd
            navigationController?.pushViewController(prodVC, animated: true)
        }
    }
    
    func redirectToAllProduct(){
        if let allProdVC = self.storyboard?.instantiateViewController(identifier: "ViewAllProductViewController") as? ViewAllProductViewController{
            navigationController?.pushViewController(allProdVC, animated: true)
        }
    }
}

//MARK: - Activity Inidcator View
extension ParentVC{
    func loadingView(loadView : NVActivityIndicatorView){
        loadView.type = .circleStrokeSpin
        loadView.color = UIColor(red: 10/255, green: 25/255, blue: 92/255, alpha: 1)
        loadView.backgroundColor = .clear
    }
}
