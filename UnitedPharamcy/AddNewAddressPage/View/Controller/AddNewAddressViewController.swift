//
//  AddNewAddressViewController.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 19/10/23.
//

import UIKit
import GoogleMaps

class AddNewAddressViewController: ParentVC {
    //MARK: - Outlets
    @IBOutlet weak var mapView : GMSMapView!
    @IBOutlet weak var addNewBTN : UIButton!
    @IBOutlet weak var textFieldTableView : UITableView!
    //MARK: - Variables
    let manager = CLLocationManager()
    var dataArray : [TextFields] = []
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareSetup()
        self.registerXib()
    }
}
//MARK: - Prepare UI Functions
extension AddNewAddressViewController{
    func prepareSetup(){
        dataArray = TextFieldsObjects.shared.addressObject()
        manager.delegate = self
        checkLocationServices()
        addNewBTN.layer.cornerRadius = 10
        textFieldTableView.delegate = self
        textFieldTableView.dataSource = self
        mapView.delegate = self
        mapView.settings.compassButton = true
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
    }
    func registerXib(){
        textFieldTableView.register(UINib(nibName: "CustomTextfieldCell", bundle: nil), forCellReuseIdentifier: "textFieldCell")
    }
    //Check if Location permission is allowed or not
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            TextFieldsObjects.shared.checkAuthorisation(status: manager.authorizationStatus)
        }
        else {
            print("location not enabled")
        }
    }
}
//MARK: - MapView Functions
extension AddNewAddressViewController : CLLocationManagerDelegate,GMSMapViewDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        if let userLocation = mapView.myLocation{
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
            marker.title = "Current Location"
            marker.iconView = UIImageView(image: UIImage(named: "userlocation"))
            marker.isTappable = false
            marker.map = mapView
            let camera = GMSCameraPosition(latitude: userLocation.coordinate.latitude, longitude:  userLocation.coordinate.longitude, zoom: 5.0)
            mapView.camera = camera
        }
        else{
            print("user location unknown")
        }
    }

    
}
//MARK: - TableView Functions
extension AddNewAddressViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let textFieldCell = tableView.dequeueReusableCell(withIdentifier: "textFieldCell", for: indexPath) as! CustomTextfieldCell
        textFieldCell.selectionStyle = .none
        textFieldCell.setUpTextFieldData(data: dataArray[indexPath.row])
        return textFieldCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
