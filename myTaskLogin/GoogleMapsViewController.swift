//
//  GoogleMapsViewController.swift
//  myTaskLogin
//
//  Created by shereen on 1/4/20.
//  Copyright © 2020 shereen. All rights reserved.

import UIKit
import GoogleMaps

protocol MapDelegate {
    func locationFromMap(lat:Double,long:Double,address:String)
}

class GoogleMapsViewController: UIViewController, GMSMapViewDelegate {
    
    //MARK: - Outlets
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var markerImage: UIImageView!
    
    var delegate:MapDelegate?
    let locationManager = CLLocationManager()
    var currentLocation:CLLocationCoordinate2D?{
        didSet{
            guard oldValue == nil else {
                return
            }
            mapView.camera = GMSCameraPosition.camera(withLatitude: currentLocation?.latitude ?? 0, longitude: currentLocation?.longitude ?? 0, zoom: 17)
            
        }
    }
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        self.configLocationManager()
        self.setupMap()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
       super.viewWillDisappear(animated)
       locationManager.stopUpdatingLocation()
    }
    
}


//MARK: - Location Manage setups & Delegate
extension GoogleMapsViewController:CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        
        currentLocation = locValue
    }
    
    private func configLocationManager(){
        self.locationManager.requestAlwaysAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
             locationManager.distanceFilter = kCLDistanceFilterNone
          }
    }
    
    func setupMap(){
        mapView.delegate = self
        mapView.isMyLocationEnabled = true
    }
    
    @IBAction func tapMyLocation(_ sender: Any) {
        guard let lat = self.mapView.myLocation?.coordinate.latitude,
        let lng = self.mapView.myLocation?.coordinate.longitude else { return }
        
        let camera = GMSCameraPosition.camera(withLatitude: lat ,longitude: lng , zoom: 17)
        self.mapView.animate(to: camera)

    }
    
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        print ("Postion" ,position)
    }
    
 }
