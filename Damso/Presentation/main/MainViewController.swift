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

class MainViewController: UIViewController, UISheetPresentationControllerDelegate, CLLocationManagerDelegate{
    //MARK: - Properties
    var locationManager = CLLocationManager()
    lazy var naverMapView = NMFNaverMapView()
    var pinArr: Array<Pin> = []
    var markerArr: Array<NMFMarker> = []
    var marker = NMFMarker()
    
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        naverMapView = NMFNaverMapView(frame: view.frame)
        naverMapView.showLocationButton = true
        view.addSubview(naverMapView)
        
        naverMapView.mapView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true //메인화면은 화면을 꽉차게 설정
        naverMapView.mapView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true //대신 하단은 safeAreaLayoutGuide에 맞춰서
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            print("위치 서비스 On 상태")
            locationManager.startUpdatingLocation()
            print(locationManager.location?.coordinate)
            
            //현 위치로 카메라 이동
            let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: locationManager.location?.coordinate.latitude ?? 37.545251, lng: locationManager.location?.coordinate.longitude ?? 126.952514)) //공덕 프론트 1을 시작점으로 세팅
            cameraUpdate.animation = .easeIn
            naverMapView.mapView.moveCamera(cameraUpdate)
            
        } else {
            print("위치 서비스 Off 상태")
        }
    }
    
    
    //MARK: - viewWillApear
    override func viewWillAppear(_ animated: Bool){
        self.markerArr = []
        
        MarkersHTTPMethod.markersHTTPMethod.callPin() { pinInfoArr in
            self.pinArr = pinInfoArr
            for data in self.pinArr{
                self.markerArr.append(NMFMarker(position: NMGLatLng(lat: Double(data.la)!, lng: Double(data.lo)!)))
                self.markerArr[self.markerArr.count-1].mapView = self.naverMapView.mapView
                self.markerArr[self.markerArr.count-1].touchHandler = { (overlay) -> Bool in
                    DetailSimpleHTTPMethod.detailSimpleHTTPMethod.callDetail(facilityID: data.facilityId, completionHandler: {simpleArr in
                        print(simpleArr)
                        
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        guard let bottomSheetVC = storyboard.instantiateViewController(identifier: "BottomSheetViewController") as? BottomSheetViewController else {return}
                        bottomSheetVC.titleText = simpleArr[0].title
                        bottomSheetVC.gradeText = simpleArr[0].rating
                        bottomSheetVC.userReportArea = simpleArr[0].report
                        
                        if let sheet = bottomSheetVC.sheetPresentationController {
                          // customize
                            sheet.detents = [
                                    .custom { _ in
                                        return 200
                                    },
                                    .custom { context in
                                        return context.maximumDetentValue * 0.6
                                    }
                                ]
                            sheet.largestUndimmedDetentIdentifier = .medium
                            sheet.preferredCornerRadius = 20
                        }
                        
                        self.present(bottomSheetVC, animated: false, completion: nil)

                    })
                    return false
                }
            }
        }
    }
}
