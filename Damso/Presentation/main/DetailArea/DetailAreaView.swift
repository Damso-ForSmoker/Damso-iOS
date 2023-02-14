//
//  DetailAreaView.swift
//  Damso
//
//  Created by 문정호 on 2023/02/15.
//

import UIKit
import NMapsMap
import SnapKit
import Then

class DetailAreaView: BaseView {
    //MARK: - Properties
    let mapView = NMFMapView()
    let scrollView = UIScrollView().then{
        $0.backgroundColor = .white
        $0.showsHorizontalScrollIndicator = false
    }
    let contentView = UIView()
    let imgView = UIImageView().then {
        $0.image = UIImage(named: "CigaretteImg")?.withTintColor(.darkGray)
        $0.backgroundColor = .systemBackgroundColor
        $0.contentMode = .center
    }
    
    let isUserReportLabel = UILabel().then{
        $0.text = "사용자 제보"
        $0.tintColor = .systemBackgroundColor
        $0.font = UIFont(name: "RobotoCondensed-Regular", size: 12)
    }
    
    let titleTitleLabel = UILabel().then{
        $0.text = "흡연구역명 or 위치 명"
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 20)
        $0.adjustsFontSizeToFitWidth = true
        $0.tintColor = .black
    }
    
    let locationLabel = UILabel().then{
        $0.text = "위치 정보"
        $0.font = UIFont(name: "RobotoCondensed-Regular", size: 12)
        $0.adjustsFontSizeToFitWidth = true
    }
    
    let starImg = UIImageView().then{
        $0.image = UIImage(named: "Star")
        $0.contentMode = .center
    }
    
    let gradeLabel = UILabel().then{
        $0.text = "3.7"
        $0.font = UIFont(name: "RobotoCondensed-Regular", size: 12)
    }
    
    let heartButton = UIButton().then{
        $0.setImage(UIImage(named: "Heart"), for: .normal)
        $0.setImage(UIImage(named: "Heart"), for: .selected)
        $0.backgroundColor = .clear
    }
    
    let facilityInfoTitle = UILabel().then {
        $0.text = "시설 정보"
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 16)
    }
    
    let correctionButton = UIButton().then{
        var config = UIButton.Configuration.gray()
        config.cornerStyle = .capsule
        $0.setTitle("정보 수정하기", for: .normal)
        $0.configuration = config
    }
    
    let facilityInfoView = UIView().then{
        $0.layer.shadowColor = UIColor.black.cgColor //그림자 색
        $0.layer.shadowOffset = CGSize(width: 20, height: 10) //그림자를 어디에 배치할지
        $0.layer.shadowRadius = 9 //그림자 꼭짓점이 둥근 정도
        $0.layer.shadowOpacity = 0.5 //그림자 색의 진한 정도
    }
    let locationInfoLabel = UILabel().then{
        $0.text = "위치 :"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 12)
        $0.adjustsFontSizeToFitWidth = true
    }
    let facilityType = UILabel().then{
        $0.text = "시설 형태 :"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 12)
        $0.adjustsFontSizeToFitWidth = true
    }
    let installAgency = UILabel().then{
        $0.text = "설치 주체 :"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 12)
        $0.adjustsFontSizeToFitWidth = true
    }
    let reviewTitle = UILabel().then{
        $0.text = "후기"
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 16)
    }
    let reviewView = UIView().then{ //나중에 콜렉션 뷰로 변경해야할 듯 함.
        $0.layer.shadowColor = UIColor.black.cgColor //그림자 색
        $0.layer.shadowOffset = CGSize(width: 20, height: 10) //그림자를 어디에 배치할지
        $0.layer.shadowRadius = 9 //그림자 꼭짓점이 둥근 정도
        $0.layer.shadowOpacity = 0.5 //그림자 색의 진한 정도
    }
    let reviewWriteButton = UIButton().then{
        var config = UIButton.Configuration.gray()
        config.cornerStyle = .capsule
        $0.setTitle("후기 남기기", for: .normal)
        $0.configuration = config
    }
    //MARK: - setupUI
    override func setupUI() {
        
    }
    //MARK: - setConstraints
    override func setConstraints() {
        
    }

}
