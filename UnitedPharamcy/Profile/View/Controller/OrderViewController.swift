//
//  OrderViewController.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 04/10/23.
//

import UIKit
import SkyFloatingLabelTextField

class OrderViewController: ParentVC {
    //MARK: - Outlets
    @IBOutlet var orderTF : [SkyFloatingLabelTextField]!
    @IBOutlet weak var findOrderBy : UITextField!
    @IBOutlet weak var toFindOrder : SkyFloatingLabelTextField!
    @IBOutlet weak var submitBtn : UIButton!
    //MARK: - Variables
    var findOrderByArray  = ["Email Address","Zip Code"]
    var placeHolder = "Email Address"
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareUI()
        self.findOrderByTF()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        tabBarController?.tabBar .isHidden = false
    }
}

//MARK: - Prepare UI Functins
extension OrderViewController{
    func prepareUI(){
        self.tabBarController?.tabBar.isHidden = true
        findOrderBy.delegate = self
        findOrderBy.layer.borderWidth = 0.5
        findOrderBy.layer.borderColor = UIColor.gray.cgColor
        findOrderBy.layer.cornerRadius = 5
        let imageView = UIImageView()
        imageView.image = UIImage(named: "arrow-ios-down-outline")
        findOrderBy.leftView = imageView
    }
    func findOrderByTF(){
        let imageIcon = UIImageView()
        imageIcon.image = UIImage(named: "arrow-ios-down-outline")
        let contentView = UIView()
        contentView.addSubview(imageIcon)
        contentView.frame = CGRect(x: 0, y: 0, width: UIImage(named: "arrow-ios-down-outline")!.size.width, height: UIImage(named: "arrow-ios-down-outline")!.size.height)
        imageIcon.frame = CGRect(x: -15, y: 0, width: UIImage(named: "arrow-ios-down-outline")!.size.width, height: UIImage(named: "arrow-ios-down-outline")!.size.height)
        findOrderBy.rightView = contentView
        findOrderBy.rightViewMode = .always
    }
}
//MARK: - PickerView Functions
extension OrderViewController : UITextFieldDelegate, UIPickerViewDelegate,UIPickerViewDataSource{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        findOrderBy.inputView = pickerView
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 100.0, height: 44.0))
        toolBar.isTranslucent = true
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(self.closeAction))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let placeholder = UIBarButtonItem(title: placeHolder, style: .done, target: self, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.closeAction))
        toolBar.setItems([cancelButton,flexibleSpace,placeholder,flexibleSpace,doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        findOrderBy.inputAccessoryView = toolBar
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return findOrderByArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return findOrderByArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        findOrderBy.text = findOrderByArray[row]
        if findOrderByArray[row] == "Email Address"{
            toFindOrder.title = "Email Address"
            toFindOrder.placeholder = "Email Address"
        }
        else{
            toFindOrder.title = "Zip Code"
            toFindOrder.placeholder = "Zip Code"
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    @objc func closeAction(){
        self.view.endEditing(true)
    }
}
