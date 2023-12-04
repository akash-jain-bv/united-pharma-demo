//
//  ProfileViewController.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 04/10/23.
//

import UIKit

class ProfileViewController: ParentVC {
    //MARK: - Outlets
    @IBOutlet weak var profileTableView : UITableView!
    //MARK: - Variables
    var dataArray : [ProfileData] = []
    var isLoggedIn : Bool = false
//MARK: - View Lifecycle
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
extension ProfileViewController{
    func prepareUI(){
        if isLoggedIn{
            dataArray = ProfileObject().profileLoggedInObject()
        }
        else{
            dataArray = ProfileObject().profileNotLoggedInObject()
        }
        profileTableView.delegate = self
        profileTableView.dataSource = self
    }
    func registerXib(){
        profileTableView.register(UINib(nibName: "CustomProfilePage", bundle: nil), forCellReuseIdentifier: "profileCell")
    }
}
//MARK: - TableView Functions
extension ProfileViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let profileCell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! CustomProfilePage
        profileCell.setUpProfileData(profileData: dataArray[indexPath.row])
        return profileCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
        let headerLabel = UILabel(frame: CGRect(x: 20, y: 0, width: tableView.frame.size.width, height: 50))
        headerLabel.text = "CUSTOMER PROFILE"
        headerLabel.font = .systemFont(ofSize: 20)
        headerView.addSubview(headerLabel)
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if isLoggedIn{
            return 60
        }
        else{
            return 0
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let profileCell = tableView.cellForRow(at: indexPath) as! CustomProfilePage
        switch profileCell.profileLabel.text {
        case "Sign In":
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let loginVC = storyboard.instantiateViewController(identifier: "MainPage") as? MainPage{
                let loginNavigation = UINavigationController(rootViewController: loginVC)
                view.window?.rootViewController = loginNavigation
                view.window?.makeKeyAndVisible()
            }
        case "Orders And Returns":
            if let ordersVC = self.storyboard?.instantiateViewController(identifier: "OrderViewController") as? OrderViewController{
                self.navigationController?.pushViewController(ordersVC, animated: true)
            }
        default:
            return
        }
    }
}
