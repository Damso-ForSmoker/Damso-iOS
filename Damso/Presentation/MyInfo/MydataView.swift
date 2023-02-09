//
//  MydataView.swift
//  
//
//  Created by 최유빈 on 2023/01/22.
//

import UIKit
import SnapKit
import Then

class MydataView: UIView {

    var titleLabel = UILabel().then{
        $0.backgroundColor = .white
        $0.text = "내 정보"
        $0.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        $0.font = UIFont(name: "NotoSans-Bold", size: 20)
        $0.textAlignment = .center
    }
    
    var notLoginView = UIView().then {
  //      $0.frame = CGRect(x: 0, y: 0, width: 390, height: 167)
        $0.backgroundColor = .white
    }
    
    var shadows = UIView().then{
        $0.frame = CGRect(x: 0, y: 0, width: 390, height: 167)
        $0.clipsToBounds = false
    }
    
    let shadowPath0 = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 390, height: 167) , cornerRadius: 10)
    
    
    let layer0 = CALayer().then {
        $0.shadowPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 390, height: 167) , cornerRadius: 10).cgPath
        $0.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        $0.shadowOpacity = 1
        $0.shadowRadius = 4
        $0.shadowOffset = CGSize(width: 0, height: 4)
       // $0.bounds = shadows.bounds
       // $0.position = shadows.center
    }
    
    var shapes = UIView().then{
        $0.frame = CGRect(x: 0, y: 0, width: 390, height: 167)
        $0.clipsToBounds = true
    }
    
    let layer1 = CALayer().then {
        $0.backgroundColor = UIColor(red: 0.259, green: 0.522, blue: 0.957, alpha: 1).cgColor
       // $0.bounds = shapes.bounds
       // $0.position = shapes.center
    }
    
    let notloginLabel = UILabel().then {
        $0.text = "로그인이 되어있지 않아요!"
        $0.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        $0.font = UIFont(name: "NotoSans-Bold", size: 20)
        $0.textAlignment = .center
    }
    
    let infologLabel = UILabel().then {
        $0.text = "담소의 다양한 기능을 이용하기 위해서는 로그인이 필요해요"
        $0.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        $0.font = UIFont(name: "NotoSansDisplay-ExtraCondensed", size: 12)
        $0.textAlignment = .center
    }
    
/*    let loginButton = UIButton().then {
        $0.setTitle("로그인 하러 가기", for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        $0.setTitleColor(UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1), for: .normal)
        $0.setUnderline()
    } */
    var setLabel = UILabel().then {
        $0.text = "설정"
        $0.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        $0.font = UIFont(name: "NotoSans-Bold", size: 20)
        $0.textAlignment = .center
    }
    
    override init(frame: CGRect) {
            super.init(frame: frame)

            setupUI()
            setConstraints()
        }
        
        required init?(coder: NSCoder) {
            fatalError()
        }
        
        /// UI 설정
        /// - addSubviews를 하거나 뷰의 배경색을 바꾸는 등 설정을 합니다.
        func setupUI() {
            self.backgroundColor = .white
            self.addSubview(titleLabel)
            self.addSubview(notLoginView)
            notLoginView.addSubview(shadows)
            
            layer0.bounds = shadows.bounds
            layer0.position = shadows.center
            shadows.layer.addSublayer(layer0)
            
            notLoginView.addSubview(shapes)
            notLoginView.addSubview(notloginLabel)
            notLoginView.addSubview(infologLabel)
        //    self.addSubview(loginButton)
            
            layer1.bounds = shapes.bounds
            layer1.position = shapes.center
            shapes.layer.addSublayer(layer1)
            shapes.layer.cornerRadius = 10
            
            self.addSubview(setLabel)

        }
        
        /// UI 제약조건 설정
        /// - Anchor, Snapkit 등을 이용해 UI 컴포넌트의 위치, 크기 등 제약조건을 설정합니다.
        func setConstraints() {
            titleLabel.snp.makeConstraints{ make in
                make.width.equalTo(61)
                make.height.equalTo(27)
                make.top.equalTo(safeAreaLayoutGuide).offset(11)
                make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            }
            
            notLoginView.snp.makeConstraints{ make in
                make.width.equalTo(390)
                make.height.equalTo(167)
                
                make.top.equalTo(titleLabel.snp.bottom).offset(23)
                make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            }
            
            setLabel.snp.makeConstraints{ make in
                make.top.equalTo(safeAreaLayoutGuide).offset(244)
                make.left.equalToSuperview().offset(17)
            }
     
            notloginLabel.snp.makeConstraints { make in
                make.top.equalTo(notLoginView.snp.top).offset(36)
                make.left.equalTo(notLoginView.snp.left).offset(85)
            }
            
            infologLabel.snp.makeConstraints { make in
                make.top.equalTo(notLoginView.snp.top).offset(61)
                make.left.equalTo(notLoginView.snp.left).offset(50)
            }
            
 /*           loginButton.snp.makeConstraints { make in
                make.top.equalTo(notLoginView.snp.top).offset(125)
                make.left.equalTo(notLoginView.snp.left).offset(143)
                make.width.equalTo(106)
                make.height.equalTo(19)
            }*/
    
    }
    

}

/*
 extension UIButton {
 func setUnderline() {
 guard let title = title(for: .normal) else {return}
 let attributedString = NSMutableAttributedString(string: title)
 attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue,
 range: NSRange(location: 0, length: title.count))
 
 setAttributedTitle(attributedString, for: .normal)
 }
 } */
