//
//  SignUpViewController.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 05/10/23.
//

import UIKit
import CountryPickerView
import SkyFloatingLabelTextField

class SignUpViewController: UIViewController, UITextFieldDelegate {
    //MARK: - Outlets
    @IBOutlet weak var signUpBtn : UIButton!
    @IBOutlet weak var loginLabel : UILabel!
    @IBOutlet weak var countryView: UIView!
    @IBOutlet var signUpTF : [SkyFloatingLabelTextField]!
    //MARK: - Variables
    var textFieldValue = 0
    var signupValid : Bool = false
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
        self.setupTextFields()
        self.setupLabelTap()
    }
}
//MARK: - SetupUi Functions
extension SignUpViewController{
    func initialSetup(){
        navigationController?.navigationBar.isHidden = true
        signUpBtn.layer.cornerRadius = 5
    }
    func setupTextFields(){
        //Toolbar
        for textFields in signUpTF {
            textFields.delegate = self
            textFields.clearButtonMode = .whileEditing
            let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
            let previousButton = UIBarButtonItem(image: UIImage(systemName:"chevron.up"), style: .plain, target: self, action:#selector(accessPreviousTextField))
            let nextButton = UIBarButtonItem(image: UIImage(systemName:"chevron.down"), style: .plain, target: self, action:#selector(accessNextTextField))
            let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
            let placeholder = UIBarButtonItem(title: "\(textFields.placeholder!)", style: .done, target: self, action: nil)
            let flexibleSpace2 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
            let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(returnKeyboard))
            toolBar.items = [previousButton,nextButton,flexibleSpace,placeholder,flexibleSpace2,doneButton]
            toolBar.sizeToFit()
            textFields.inputAccessoryView = toolBar
        }
    }
    //Toolbar Buttons
    @objc func returnKeyboard(){
        for textFields in signUpTF{
            textFields.resignFirstResponder()
        }
    }
    @objc func accessPreviousTextField()-> Bool{
        if textFieldValue == 0{
            return false
        }
        let previousTextField = signUpTF[textFieldValue - 1]
        return previousTextField.becomeFirstResponder()
    }
    @objc func accessNextTextField()-> Bool{
        if textFieldValue == signUpTF.count - 1{
            return false
        }
        let nextTextField = signUpTF[textFieldValue + 1]
        return nextTextField.becomeFirstResponder()
    }
    //texField function
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textFieldValue = textField.tag - 1
        return true
    }
    //Label Function
    func setupLabelTap() {
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.tappedOnLabel(_:)))
        self.loginLabel.isUserInteractionEnabled = true
        self.loginLabel.addGestureRecognizer(labelTap)
        
    }
    @objc func tappedOnLabel(_ gesture: UITapGestureRecognizer) {
        self.navigationController?.popViewController(animated: true)
    }
}
//MARK: - Button Actions
extension SignUpViewController{
    @IBAction func backButton(_ sender : UIButton){
        navigationController?.popViewController(animated: true)
    }
    @IBAction func allTextField(_ sender: SkyFloatingLabelTextField) {
        let isValid = RegistrationTextFieldsName.allCases[sender.tag - 1].isValidInput(string: sender.text!)
        if !(isValid){
            sender.errorMessage = "Invalid"
            sender.errorColor = .red
        }
        else if sender.text == ""{
            sender.errorMessage = "Required"
            sender.errorColor = .red
        }
        else{
            sender.errorMessage = ""
        }
    }
    @IBAction func signinButtonClicked(_ sender : UIButton){
        for items in 0..<signUpTF.count{
            if signUpTF[items].text == ""{
                signUpTF[items].errorMessage = "Required"
                signUpTF[items].errorColor = .red
                signupValid = false
                break
            }
            else{
                signupValid = true
            }
        }
        if signupValid{
            let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
            let displayMsg =  UIAlertAction(title: "Verification Code Sent Successful", style: .default, handler: nil)
            alert.addAction(displayMsg)
            alert.view.tintColor = .black
            self.present(alert, animated: true)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2){
              alert.dismiss(animated: true, completion: nil)
            }
            signupValid = false
        }
    }
}
