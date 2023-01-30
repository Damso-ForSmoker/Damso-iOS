//
//  ReportView.swift
//  Damso
//
//  Created by 문정호 on 2023/01/17.
//

import UIKit
import NMapsMap
import SnapKit
import Then

class ReportView: BaseView, CLLocationManagerDelegate {
    let identifier = "ReportView"
    
    var locationManager = CLLocationManager()
    
    let mapView = NMFNaverMapView().then{
        $0.showLocationButton = true
    }
    
    let marker = NMFMarker()
    
    let reportButton = UIButton().then {
        $0.titleLabel?.font = UIFont(name: "NotoSansKR-Medium", size: 17)
        $0.layer.cornerRadius = 17
        $0.setTitle("제보하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .primaryColor
    }
    
    let box = UIView().then {
        $0.backgroundColor = .systemBackgroundColor
        $0.layer.cornerRadius = 20
    }
    
    let titlelabel = UILabel().then {
        $0.text = "지정한 위치"
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 15)
        $0.textColor = .black
    }
    
    let locationLabel = UILabel().then {
        $0.adjustsFontSizeToFitWidth = true
        $0.text = "서울특별시 용산구 서빙고로 17"
        $0.font = UIFont(name: "NotoSansKR-Medium", size: 17)
        $0.textColor = .black
    }
    
    
    override func setupUI() {
        self.addSubview(mapView)
        self.addSubview(titlelabel)
        self.addSubview(box)
        self.addSubview(reportButton)
        self.addSubview(locationLabel)
        locationManager.delegate = self
        setLocationManager()
    }
    
    override func setConstraints() {
        reportButton.snp.makeConstraints{ make in
            make.trailing.leading.equalTo(safeAreaLayoutGuide).inset(100)
            make.bottom.equalTo(safeAreaLayoutGuide).inset(14)
            make.height.equalTo(45)
        }
        box.snp.makeConstraints{ make in
            make.trailing.leading.equalTo(safeAreaLayoutGuide).inset(16) // superView 또는 safeArea 기준으로는 inset을 쓰는 것이 편함
            make.bottom.equalTo(reportButton.snp.top).offset(-15)
            make.height.equalTo(50)
        }
        locationLabel.snp.makeConstraints{ make in
            make.trailing.leading.top.bottom.equalTo(box).inset(10)
        }
        titlelabel.snp.makeConstraints{ make in
            make.size.equalTo(titlelabel.intrinsicContentSize)
            make.bottom.equalTo(box.snp.top).offset(-6)
            make.leading.equalTo(safeAreaLayoutGuide).inset(16)
        }
        mapView.snp.makeConstraints{ make in
            make.top.trailing.leading.equalTo(safeAreaLayoutGuide)
            make.bottom.equalTo(titlelabel.snp.top).offset(-11)
        }
        
        
        
    }
    
    
    //MARK: - Helper
    
    //locationManager를 세팅하는 함수
    func setLocationManager(){
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization() //위치 서비스 권한을 허용할지 묻는 팝업
        
        if CLLocationManager.locationServicesEnabled() { //위치 권한이 허용되어 있을 경우
            print("위치 서비스 On 상태")
            locationManager.startUpdatingLocation() //현재 위치를 가져온다.
            print("locationManager.location?.coordinate")
            
            updateLocation()
            
            marker.position = NMGLatLng(
                lat: locationManager.location?.coordinate.latitude ?? 0,
                lng: locationManager.location?.coordinate.longitude ?? 0)
            marker.mapView = mapView.mapView
        } else {
            print("위치 서비스 off 상태")
        }
    }
    
    func updateLocation(){
        let cameraUpadate = NMFCameraUpdate(position: mapView.mapView.cameraPosition)
        cameraUpadate.animation = .easeIn
        mapView.mapView.moveCamera(cameraUpadate)
    }
    
}
