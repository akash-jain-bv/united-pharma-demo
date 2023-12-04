//
//  OnboardingViewController.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 02/11/23.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var loginBtn : UIButton!
    @IBOutlet weak var passwordTF : UITextField!
    @IBOutlet weak var fingerprintView : UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
}

extension OnboardingViewController{
    func setupUI(){
        loginBtn.layer.cornerRadius = 10
        passwordTF.layer.cornerRadius = 10
        fingerprintView.layer.cornerRadius = 10
    }
}
