//
//  SortByViewController.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 06/11/23.
//

import UIKit

class SortByViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var sortTableView : UITableView!
    @IBOutlet weak var backView : UIView!
    
    //MARK: - Variables
    var sortByArray : [SortBy] = []
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareUI()
        self.registerXib()
        self.addAnimation()
    }
}
//MARK: - Prepare UI Function
extension SortByViewController{
    func prepareUI(){
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        sortByArray = ViewAllProductsObject.shared.sortObject()
        sortTableView.delegate = self
        sortTableView.dataSource = self
    }
    func registerXib(){
        sortTableView.register(UINib(nibName: "CustomSortByCell", bundle: nil), forCellReuseIdentifier: "CustomSortByCell")
    }
    func addAnimation(){
        self.backView.transform = CGAffineTransform(translationX: 0, y: self.backView.frame.size.height)
        UIView.animate(withDuration: 0.4) {
            self.backView.transform = .identity
        }
    }
}
//MARK: - TableView Functions
extension SortByViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortByArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sortCell = tableView.dequeueReusableCell(withIdentifier: "CustomSortByCell", for: indexPath) as! CustomSortByCell
        sortCell.setUpData(data: sortByArray[indexPath.row])
        return sortCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sortCell = tableView.cellForRow(at: indexPath) as! CustomSortByCell
        sortCell.selectImage.image = UIImage(named: "selectRB_ic")
        self.backView.transform = .identity
        UIView.animate(withDuration: 0.4, animations: {
            self.backView.transform = CGAffineTransform(translationX: 0, y: self.backView.frame.size.height)
        }){ _ in
            self.view.removeFromSuperview()
        }
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let sortCell = tableView.cellForRow(at: indexPath) as! CustomSortByCell
        sortCell.selectImage.image = UIImage(named: "unselectRB_ic")
    }
}
