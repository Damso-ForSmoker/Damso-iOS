//
//  LoginDataView.swift
//  Datamy
//
//  Created by 최유빈 on 2023/01/31.
//

import UIKit
import SnapKit
import Then

class LoginDataView: UIView {

    
    let titleLabel = UILabel().then{
        $0.frame = CGRect(x: 0, y: 0, width: 61, height: 27)
        $0.text = "내 정보"
        $0.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        $0.font = UIFont(name: "NotoSans-Bold", size: 20)
        $0.textAlignment = .center
    }
    
    let loginView = UIView().then {
        $0.backgroundColor = .white
    }
    
    let shadows = UIView().then{
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
    
    let shapes = UIView().then{
        $0.frame = CGRect(x: 0, y: 0, width: 390, height: 167)
        $0.clipsToBounds = true
    }
    
    let layer1 = CALayer().then {
        $0.backgroundColor = UIColor(red: 0.259, green: 0.522, blue: 0.957, alpha: 1).cgColor
       // $0.bounds = shapes.bounds
       // $0.position = shapes.center
    }
    
    let userLabel = UILabel().then {
        $0.text = "사용자1"
        $0.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        $0.font = UIFont(name: "NotoSans-Bold", size: 20)
        $0.textAlignment = .center
    }
    
    let profileImage = UIImageView().then {
        $0.image = UIImage(named: "profile")
        $0.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
    }
    
    let firstLabel = UILabel().then {
        $0.text = "내 제보 현황"
        $0.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        $0.font = UIFont(name: "NotoSans-Bold", size: 17)
        $0.textAlignment = .center
    }
    
    let setLabel = UILabel().then {
        $0.text = "설정"
        $0.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        $0.font = UIFont(name: "NotoSans-Bold", size: 20)
        $0.textAlignment = .center
    }
    
    let secondLabel = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "제보 건수: 0", attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        $0.textColor =  UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
    }
    
//    let setButton = UIButton().then {
//        $0.setImage(UIImage(named: "Vector"), for: .normal)
//    }
    
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
            self.addSubview(loginView)
            loginView.addSubview(shadows)
            
            layer0.bounds = shadows.bounds
            layer0.position = shadows.center
            shadows.layer.addSublayer(layer0)
            
            self.loginView.addSubview(shapes)
            loginView.addSubview(userLabel)
            loginView.addSubview(profileImage)
            loginView.addSubview(firstLabel)
            loginView.addSubview(secondLabel)
       //     loginView.addSubview(setButton)
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
                make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(11)
                make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
                
            }
            
            loginView.snp.makeConstraints{ make in
                make.width.equalTo(390)
                make.height.equalTo(167)
                make.top.equalTo(titleLabel.snp.bottom).offset(23)
                make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            }
            
            setLabel.snp.makeConstraints{ make in
                make.top.equalTo(safeAreaLayoutGuide).offset(244)
                make.left.equalToSuperview().offset(17)
            }
     
            userLabel.snp.makeConstraints { make in
                make.top.equalTo(loginView.snp.top).offset(77)
                make.left.equalTo(loginView.snp.left).offset(162)
            }
            
            profileImage.snp.makeConstraints { make in
                make.top.equalTo(loginView.snp.top).offset(15)
                make.left.equalTo(loginView.snp.left).offset(170)
                make.width.height.equalTo(50)
            }
            
            firstLabel.snp.makeConstraints { make in
                make.top.equalTo(loginView.snp.top).offset(130)
                make.left.equalTo(loginView.snp.left).offset(23)
            }
            
            secondLabel.snp.makeConstraints { make in
                make.top.equalTo(loginView.snp.top).offset(132)
                make.left.equalTo(firstLabel.snp.right).offset(182)
            }
            
//            setButton.snp.makeConstraints { make in
  //              make.top.equalTo(safeAreaLayoutGuide).offset(69)
    //            make.left.equalToSuperview().offset(363)
      //          make.width.height.equalTo(12)
        //    }
    
    }
    

}


    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */


