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
    lazy var pinArr: Array<Pin> = []
    lazy var markerArr: Array<NMFMarker> = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let naverMapView = NMFNaverMapView(frame: view.frame)
        naverMapView.showLocationButton = true
        view.addSubview(naverMapView)
        
        naverMapView.mapView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        naverMapView.mapView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        
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
            naverMapView.mapView.moveCamera(cameraUpdate)
            
        } else {
            print("위치 서비스 Off 상태")
        }
        
        //        var marker = NMFMarker()
        //        marker.position = NMGLatLng(lat: 37.5670135, lng: 126.9783740)
        //        marker.mapView = mapView
        
        //let markersHTTPMethod = MarkersHTTPMethod()
        
        //private init() {}
        
        
        //marker.iconImage = NMFOverlayImage(name: "marker_icon")
        
        for i in 0...9 {
            MarkersHTTPMethod.markersHTTPMethod.callPin() { pinInfoArr in
                DispatchQueue.main.async {
                    self.pinArr = pinInfoArr
                    //                    print(self.pinArr)
                    self.markerArr.append(NMFMarker(position: NMGLatLng(lat: Double(pinInfoArr[i].la)!, lng: Double(pinInfoArr[i].lo)!)))
                    self.markerArr[self.markerArr.count-1].mapView = naverMapView.mapView
                }
            }
            print(self.pinArr)
            
            
            //            markerArr.append(NMFMarker(position: NMGLatLng(lat: Double(pinArr[i].la)!, lng: Double(pinArr[i].lo)!)))
            //            markerArr[i].mapView = naverMapView.mapView
        }
    }
    
    
    
}
