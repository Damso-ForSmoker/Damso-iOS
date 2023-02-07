//
//  editView.swift
//  Datamy
//
//  Created by 최유빈 on 2023/01/31.
//

import UIKit
import SnapKit
import Then

class editView: UIView {

    let mainLabel = UILabel().then {
        $0.text = "내 정보 수정"
        $0.font = UIFont(name: "NotoSans-Bold", size: 20)
    }
    
    let backButton = UIButton().then {
        $0.setImage(UIImage(named: "back"), for: .normal)
    }
    
    let profileImg = UIImageView().then {
        $0.image = UIImage(named: "profile")
    }
    
    let setimageButton = UIButton().then {
        $0.setImage(UIImage(named: "pencil"), for: .normal)
    }
    
    let namesetLabel = UILabel().then {
        $0.text = "닉네임 설정"
        $0.font = UIFont(name: "NotoSans-SemiBold", size: 17)
    }
    
    let nameWrite = UITextField().then {
        $0.layer.backgroundColor = UIColor(red: 0.942, green: 0.942, blue: 0.942, alpha: 0.5).cgColor
        $0.layer.cornerRadius = 15
    }
    
    let editButton = UIButton().then {
        $0.setTitle("수정하기", for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 17)
        $0.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        $0.layer.backgroundColor = UIColor(red: 0.259, green: 0.522, blue: 0.957, alpha: 1).cgColor
        $0.layer.cornerRadius = 24
    }
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupUI()
        setConstraints()
    }
        
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupUI(){
        self.addSubview(mainLabel)
        self.addSubview(backButton)
        self.addSubview(profileImg)
        self.addSubview(setimageButton)
        self.addSubview(namesetLabel)
        self.addSubview(nameWrite)
        self.addSubview(editButton)
    }
    
    func setConstraints() {
        self.backgroundColor = .white
        mainLabel.snp.makeConstraints { make in
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(safeAreaLayoutGuide).offset(23)
        }
        
        backButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(6)
            make.centerY.equalTo(mainLabel.snp.centerY)
            make.width.equalTo(23)
            make.height.equalTo(29)
        }
        
        profileImg.snp.makeConstraints { make in
            make.centerX.equalTo(mainLabel.snp.centerX)
            make.top.equalTo(mainLabel.snp.bottom).offset(36)
            make.height.width.equalTo(80)
        }
        setimageButton.snp.makeConstraints { make in
            make.left.equalTo(profileImg.snp.left).offset(63)
            make.top.equalTo(mainLabel.snp.bottom).offset(88)
            make.width.height.equalTo(30)
        }
        namesetLabel.snp.makeConstraints { make in
          //  make.left.equalTo(nameWrite.snp.left)
            make.left.equalToSuperview().offset(18)
            make.top.equalTo(safeAreaLayoutGuide).offset(220)
        }
        nameWrite.snp.makeConstraints { make in
   //         make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(namesetLabel.snp.bottom).offset(9)
            make.left.equalTo(namesetLabel.snp.left)
   //         make.width.equalTo(350)
            make.height.equalTo(40)
            make.right.equalToSuperview().inset(22)
        }
        editButton.snp.makeConstraints { make in
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(nameWrite.snp.bottom).offset(431)
            make.width.equalTo(172)
            make.height.equalTo(44)
        }
        
    
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}


