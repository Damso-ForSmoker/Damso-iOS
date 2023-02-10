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
        self.addSubview(profileImg)
        self.addSubview(setimageButton)
        self.addSubview(namesetLabel)
        self.addSubview(nameWrite)
        self.addSubview(editButton)
    }
    
    func setConstraints() {
        self.backgroundColor = .white
        
        profileImg.snp.makeConstraints { make in
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(46)
            make.height.width.equalTo(80)
        }
        setimageButton.snp.makeConstraints { make in
            make.left.equalTo(profileImg.snp.left).offset(63)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(98)
            make.width.height.equalTo(30)
        }
        namesetLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(18)
            make.top.equalTo(profileImg.snp.bottom).offset(54)
        }
        nameWrite.snp.makeConstraints { make in
            make.top.equalTo(namesetLabel.snp.bottom).offset(9)
            make.left.equalTo(namesetLabel.snp.left)
            make.height.equalTo(40)
            make.right.equalToSuperview().inset(22)
        }
        editButton.snp.makeConstraints { make in
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-37)
            make.width.equalTo(172)
            make.height.equalTo(44)
        }
        
    
    }

}


