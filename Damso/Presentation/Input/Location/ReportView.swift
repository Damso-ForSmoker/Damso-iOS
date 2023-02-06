//
//  ReportView.swift
//  Damso
//
//  Created by 문정호 on 2023/01/17.
//

import UIKit
import NMapsMap
import CoreLocation
import SnapKit
import Then

class ReportView: BaseView {
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
        $0.text = ""
        $0.adjustsFontSizeToFitWidth = true //크기에 맞춰 폰트 사이즈 조절 설정
        $0.font = UIFont(name: "NotoSansKR-Medium", size: 17)
        $0.textColor = .black
    }
    
    override func setupUI() {
        self.addSubview(mapView)
        self.addSubview(titlelabel)
        self.addSubview(box)
        self.addSubview(reportButton)
        box.addSubview(locationLabel)
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
            make.trailing.leading.top.bottom.equalToSuperview().inset(10)
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
    
}
