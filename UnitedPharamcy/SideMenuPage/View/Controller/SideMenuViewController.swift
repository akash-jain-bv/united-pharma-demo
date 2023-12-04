//
//  SideMenuViewController.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 20/09/23.
//

import UIKit

class SideMenuViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var signInView : UIView!
    @IBOutlet weak var sideMenuTableView : UITableView!
    @IBOutlet weak var signInLabel : UILabel!
    
    //MARK: - Variables
    var sideMenuData : [SideMenu] = []
    var isDropDown : Bool = false
    var selectedCell = 0
    
    //MARK: - View LifeCycle
    override func viewDidLoad(){
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.signInAtrributedLabel()
        self.prepareUI()
        self.registerXib()
    }
}
//MARK: - Prepare UI Functins
extension SideMenuViewController{
    func prepareUI(){
        sideMenuData = setUpSideMenuObject().sideMenuObject()
        signInView.layer.cornerRadius = 10
        sideMenuTableView.delegate = self
        sideMenuTableView.dataSource = self
        sideMenuTableView.rowHeight = 60
    }
    func registerXib(){
        sideMenuTableView.register(UINib(nibName: "CustomSideMenuCell", bundle: nil), forCellReuseIdentifier: "sideMenuCell")
    }
    func signInAtrributedLabel(){
        let partOne = NSMutableAttributedString(string: "Sign in", attributes: [.foregroundColor: UIColor.gray, .font: UIFont.systemFont(ofSize: 18)])
        let partTwo = NSMutableAttributedString(string: "\n", attributes: nil)
        let partThree = NSMutableAttributedString(string: "to your account", attributes: [.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 20)])
        partOne.append(partTwo)
        partOne.append(partThree)
        signInLabel.attributedText = partOne
    }
}
//MARK: - TableView Functions
extension SideMenuViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sideMenuData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sideMenuCell = tableView.dequeueReusableCell(withIdentifier: "sideMenuCell", for: indexPath) as! CustomSideMenuCell
        sideMenuCell.setUpSideMenuData(data: sideMenuData[indexPath.row])
        return sideMenuCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isDropDown && indexPath.row == 2{
            return 200
        }
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let text = sideMenuData[indexPath.row].labelDescription
        let sideMenuCell = tableView.cellForRow(at: indexPath) as! CustomSideMenuCell
        if text == "Our Services" && isDropDown == false{
            sideMenuCell.dropDownTableView.isHidden = false
            isDropDown = true
        }
        else if text == "Categories"{
            let scenes = UIApplication.shared.connectedScenes
            let windowScene = scenes.first as? UIWindowScene
            let window = windowScene?.windows.first
            let tabBarController =  window?.rootViewController as! TabBarController
            dismiss(animated: true, completion: nil)
            tabBarController.selectedIndex = 1
        }
        else{
            sideMenuCell.dropDownTableView.isHidden = true
            isDropDown = false
        }
        tableView.reloadData()
    }
}
