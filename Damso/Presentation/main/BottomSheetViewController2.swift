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
import NMapsGeometry


class BottomSheetViewController2: UIViewController {

    var locationManager = CLLocationManager()
    lazy var naverMapView = NMFMapView()
    var fID: Int?
    var lat: String?
    var lng: String?
    var lat1: String = ""
    var lng1: String = ""
    var titleText: String?
    
    @IBAction func reportPush(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let bottomSheetVC = storyboard.instantiateViewController(identifier: "ReportPushViewController")
            // 1
        //let bottomSheet: MDCBottomSheetController  = MDCBottomSheetController(contentViewController: bottomSheetVC)

        if let sheet = bottomSheetVC.sheetPresentationController {
          // customize
            sheet.detents = [
                    .custom { context in
                        return context.maximumDetentValue * 0.4
                    }
                ]
            //sheet.largestUndimmedDetentIdentifier = .medium
            sheet.preferredCornerRadius = 20
        }

        self.present(bottomSheetVC, animated: true, completion: nil)
    }
    
    @objc func buttonTapped(sender: UIButton!) {
        self.dismiss(animated: true)
    }
    
    
    @IBOutlet weak var subMapView: UIView!
    @IBOutlet weak var subView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        naverMapView = NMFMapView(frame: subMapView.frame)
        //naverMapView.showLocationButton = true
        subMapView.addSubview(naverMapView)
        
        naverMapView.topAnchor.constraint(equalTo: self.subMapView.topAnchor, constant: 0).isActive = true
        naverMapView.leadingAnchor.constraint(equalTo: self.subMapView.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true //대신 하단은 safeAreaLayoutGuide에 맞춰서
        naverMapView.bottomAnchor.constraint(equalTo: self.subMapView.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        print(fID!)
        print(lat!)
        print(lng!)
        let marker = NMFMarker()
        marker.position = NMGLatLng(lat: Double(lat!)!, lng: Double(lng!)!)
        marker.mapView = naverMapView
        
        let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: Double(lat!)!, lng: Double(lng!)!)) // 선택 마커 위치로 시점 이동
        
        //cameraUpdate.animation = .easeIn
        naverMapView.moveCamera(cameraUpdate)
        
        GeocodingManager.geocodingManager.callReversedGeocoding(lon: lng!, lat: lat!, completionHandler: { addressString in
                    DispatchQueue.main.async {
                        self.locationLabel.text = addressString
                        //self.subView.addSubview(self.locationLabel)
                    }
                })
        
        self.titleLabel?.text = titleText
        
        if fID! % 2 == 0 {
            self.infoLabel.text = "서울시청"
        }
        else {
            self.infoLabel.text = "마포구청"
        }
        
        let button = UIButton(type: .system)
        subMapView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        let boldSearch = UIImage(systemName: "xmark")

        button.setImage(boldSearch, for: .normal)
                
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: subMapView.leadingAnchor, constant: 16),
            button.topAnchor.constraint(equalTo: subMapView.topAnchor, constant: 16)
        ])

   
    }
    
}
