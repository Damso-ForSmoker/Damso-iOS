//
//  BottomSheetViewController2.swift
//  Damso
//
//  Created by 윤채영 on 2023/01/31.
//

import UIKit
import NMapsMap
import CoreLocation
import Alamofire

class BottomSheetViewController2: UIViewController {

    var locationManager = CLLocationManager()
    lazy var naverMapView = NMFNaverMapView()
    
//    @IBAction func reportPush(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let bottomSheetVC = storyboard.instantiateViewController(identifier: "ReportPushViewController")
//            // 1
//        //let bottomSheet: MDCBottomSheetController  = MDCBottomSheetController(contentViewController: bottomSheetVC)
//
//        if let sheet = bottomSheetVC.sheetPresentationController {
//          // customize
//            sheet.detents = [
//                    .custom { context in
//                        return context.maximumDetentValue * 0.4
//                    }
//                ]
//            //sheet.largestUndimmedDetentIdentifier = .medium
//            sheet.preferredCornerRadius = 20
//        }
//
//        self.present(bottomSheetVC, animated: false, completion: nil)
//    }
    
    @IBOutlet weak var subMapView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        naverMapView = NMFNaverMapView(frame: view.frame)
        naverMapView.showLocationButton = true
        subMapView.addSubview(naverMapView)
        
        naverMapView.mapView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        naverMapView.mapView.leadingAnchor.constraint(equalTo: self.subMapView.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true //대신 하단은 safeAreaLayoutGuide에 맞춰서
        
        
        let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: locationManager.location?.coordinate.latitude ?? Double(37.545251), lng: locationManager.location?.coordinate.longitude ?? Double(126.952514))) // 선택 마커 위치로 시점 이동
        cameraUpdate.animation = .easeIn
        naverMapView.mapView.moveCamera(cameraUpdate)
        
   
    }
    
}
