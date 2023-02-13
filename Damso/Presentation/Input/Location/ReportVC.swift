//
//  ReportVC.swift
//  Damso
//
//  Created by 문정호 on 2023/01/17.
//

import UIKit
import NMapsMap
import CoreLocation
import Then

class ReportVC: BaseVC {
    //MARK: - Properties
    
    let reportView = ReportView()
    let nextVC = ReportInputVC()
    
    
    var locationManager = CLLocationManager().then{
        $0.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    let backButtonItem = UIBarButtonItem(title: nil, style: .plain, target: self, action: nil).then{ //뒤로가기 아이템 프로퍼티
        $0.tintColor = .black //네비게이션 아이템 색 설정
    }
    
    lazy var la: Double = 0
    lazy var lo: Double = 0
    //MARK: - loadView
    override func loadView() {
        self.view = reportView
    }
    
    //MARK: - configure
    override func configure(){
        reportView.reportButton.addTarget(self, action: #selector(tappedReportButton(_:)), for: .touchUpInside)
        locationManager.delegate = self
        reportView.mapView.mapView.touchDelegate = self
        reportView.mapView.mapView.addCameraDelegate(delegate: self)
        setLocationManager()
    }
    
    
    //MARK: - setNavigation
    override func setNavigationBar() {
        self.navigationItem.title = "흡연구역 제보하기" //네비게이션바 타이틀 설정
        self.navigationController?.navigationBar.backgroundColor = .white //네비게이션 바 배경 색 설정
        self.navigationItem.backBarButtonItem = backButtonItem
    }
    
    //MARK: - Helper
    @objc func tappedReportButton(_ sender: UIButton){
        nextVC.locationString = reportView.locationLabel.text
        nextVC.la = self.la
        nextVC.lo = self.lo
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    //locationManager를 세팅하는 함수
    func setLocationManager(){
        locationManager.requestWhenInUseAuthorization() //위치 서비스 권한을 허용할지 묻는 팝업
        
        if CLLocationManager.locationServicesEnabled() { //위치 권한이 허용되어 있을 경우
            print("위치 서비스 On 상태")
            locationManager.startUpdatingLocation() //현재 위치를 가져온다.
//            print("locationManager.location?.coordinate")
            updateLocation() //카메라 이동
            
        } else {
            print("위치 서비스 off 상태")
        }
    }
    
    func updateLocation(){
        let cameraUpadate = NMFCameraUpdate(position: reportView.mapView.mapView.cameraPosition)
        cameraUpadate.animation = .easeIn
        reportView.mapView.mapView.moveCamera(cameraUpadate)
    }
}


extension ReportVC: CLLocationManagerDelegate, NMFMapViewTouchDelegate, NMFMapViewCameraDelegate{
    func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
        print("\(latlng.lat), \(latlng.lng)")
        
        self.la = latlng.lat
        self.lo = latlng.lng
        
        reportView.marker.position = NMGLatLng(
            lat: latlng.lat,
            lng: latlng.lng)
        
        reportView.marker.mapView = reportView.mapView.mapView
        
        GeocodingManager.geocodingManager.callReversedGeocoding(lon: "\(latlng.lng)", lat: "\(latlng.lat)", completionHandler: { addressString in
            DispatchQueue.main.async {
                self.reportView.locationLabel.text = addressString
            }
        })
    }
}
