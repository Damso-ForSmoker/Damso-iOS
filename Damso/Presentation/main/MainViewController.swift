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
    var pinArr: Array<Pin> = []
    var markerArr: Array<NMFMarker> = []
    var marker = NMFMarker()
    var detailParameters1: [String:Any] = [:]
    var fID: Any = 0
    //var simpleDetail: [Simple]
    
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
        
        
        MarkersHTTPMethod.markersHTTPMethod.callPin() { pinInfoArr in
            self.pinArr = pinInfoArr
            for i in 0...2 {
                self.markerArr.append(NMFMarker(position: NMGLatLng(lat: Double(pinInfoArr[i].la)!, lng: Double(pinInfoArr[i].lo)!)))
                
                self.markerArr[i].userInfo = ["facilityId": Int(pinInfoArr[i].facilityId)]
                
                
                self.marker = self.markerArr[i]
                
                self.marker.touchHandler = { (overlay: NMFOverlay) -> Bool in
                    print("\(overlay.userInfo)")
                    self.detailParameters1 = overlay.userInfo as! [String: Any]
                    self.fID = overlay.userInfo["facilityId"] ?? "facilityId"
                    
                    print(self.detailParameters1)
                    print("--------------------------")
                    
                    DetailSimpleHTTPMethod.detailSimpleHTTPMethod.callDetail(){ detailInfo in
                        
                        //self.simpleDetail = detailInfo
                        //print(self.simpleDetail)
                        
                    }
                    
                    return true
                }
                
                self.marker.mapView = naverMapView.mapView
                
                

                //self.markerArr[self.markerArr.count-1].mapView = naverMapView.mapView
                
            }
        }
        
        


        
    }
    
    
    
}
