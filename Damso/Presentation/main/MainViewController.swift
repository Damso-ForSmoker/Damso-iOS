//
//  ViewController.swift
//  Damso
//
//  Created by 윤채영 on 2023/01/10.
//

import UIKit
import NMapsMap
import CoreLocation
import Alamofire
//import URLSession
//import MaterialComponents.MaterialBottomSheet

class MainViewController: UIViewController, UISheetPresentationControllerDelegate, CLLocationManagerDelegate{
    
    var locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let mapView = NMFMapView(frame: view.frame)
        view.addSubview(mapView)
        
        mapView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        mapView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
                
        if CLLocationManager.locationServicesEnabled() {
            print("위치 서비스 On 상태")
            locationManager.startUpdatingLocation()
            print(locationManager.location?.coordinate)
                    
                    //현 위치로 카메라 이동
            let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: locationManager.location?.coordinate.latitude ?? 0, lng: locationManager.location?.coordinate.longitude ?? 0))
            cameraUpdate.animation = .easeIn
            mapView.moveCamera(cameraUpdate)
                    
                } else {
                    print("위치 서비스 Off 상태")
                }
        
        let marker = NMFMarker()
        marker.position = NMGLatLng(lat: 37.5670135, lng: 126.9783740)
        marker.mapView = mapView
        
        let naverMapView = NMFNaverMapView(frame: view.frame)
        naverMapView.showLocationButton = true
        view.addSubview(naverMapView)
        
        
        

    }
    

    
    
}



