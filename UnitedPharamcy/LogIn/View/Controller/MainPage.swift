//
//  LogInViewController.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 05/10/23.
//

import UIKit

class MainPage: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var logIn : UIButton!
    @IBOutlet weak var createAccount : UIButton!
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareUI()
    }
}
//MARK: - Prepare UI Functions and Button Action
extension MainPage{
    func prepareUI(){
        navigationController?.navigationBar.isHidden = true
        logIn.layer.cornerRadius = 5
        createAccount.layer.cornerRadius = 5
        createAccount.layer.borderWidth = 1
        createAccount.layer.borderColor = UIColor(red: 10/255, green: 25/255, blue: 92/255, alpha: 1).cgColor
    }
    
    @IBAction func skipButton(_ sender : UIButton){
        if let homeVC = self.storyboard?.instantiateViewController(identifier: "TabBarController") as? TabBarController{
            view.window?.rootViewController = homeVC
            view.window?.makeKeyAndVisible()
        }
    }
    
    @IBAction func createAccountButton(_ sender : UIButton){
        if let SignUpVC = self.storyboard?.instantiateViewController(identifier: "SignUpViewController") as? SignUpViewController{
            self.navigationController?.pushViewController(SignUpVC, animated: true)
        }
    }
}
