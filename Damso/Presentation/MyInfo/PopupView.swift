//
//  PopupView.swift
//  Datamy
//
//  Created by 최유빈 on 2023/01/30.
//

import UIKit
import Then
import SnapKit

class PopupView: UIView {

    let mydatavc = MydataVC()
    let popview = UIView().then{
        $0.backgroundColor = .white
        $0.frame = CGRect(x: 0, y: 0, width: 300, height: 200)
        $0.layer.cornerRadius = 10
    }
    
    let img = UIImageView().then{
        $0.image = UIImage(named: "alert-circle")
        $0.frame = CGRect(x: 0, y: 0, width: 55, height: 55)
    }
    
    let mLabel = UILabel().then {
        $0.text = "정말로 회원 탈퇴를 진행하시겠어요?"
        $0.font = UIFont(name: "NotoSansDisplay-Bold", size: 16)
        $0.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
    }
    
    let sLabel = UILabel().then {
        $0.text = "제보하신 흡연구역이 모두 사라져요"
        $0.font = UIFont(name: "NotoSans-Regular", size: 12)
        $0.textColor = UIColor(red: 0.658, green: 0.658, blue: 0.658, alpha: 1)
    }
    
    let delButton = UIButton().then {
        $0.layer.backgroundColor = UIColor(red: 0.823, green: 0.89, blue: 1, alpha: 1).cgColor
        $0.layer.cornerRadius = 24
        $0.setTitle("네, 탈퇴할게요", for: .normal)
        $0.titleLabel?.font = UIFont(name: "NotoSans-Regular", size: 15)
        $0.setTitleColor(UIColor(red: 0.259, green: 0.522, blue: 0.957, alpha: 1), for: .normal)
    }
    
    let cancelButton = UIButton().then {
        $0.isUserInteractionEnabled = true
        $0.isHidden = false
        $0.layer.backgroundColor = UIColor(red: 0.259, green: 0.522, blue: 0.957, alpha: 1).cgColor
        $0.layer.cornerRadius = 24
        $0.setTitle("취소", for: .normal)
        $0.titleLabel?.font = UIFont(name: "NotoSans-Regular", size: 15)
        $0.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
     //   $0.addTarget(self, action: #selector(goBack(_:)), for: .touchUpInside)
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
        self.addSubview(popview)
        self.addSubview(img)
        self.addSubview(mLabel)
        self.addSubview(sLabel)
        self.addSubview(delButton)
        self.addSubview(cancelButton)
    }
    
    func setConstraints(){
        popview.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(322)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.width.equalTo(300)
            make.height.equalTo(200)
        }
        img.snp.makeConstraints { make in
            make.top.equalTo(popview.snp.top).offset(19)
            make.left.equalTo(popview.snp.left).offset(123)
            make.width.height.equalTo(55)
        }
        mLabel.snp.makeConstraints { make in
            make.top.equalTo(img.snp.bottom).offset(7)
            make.left.equalTo(popview.snp.left).offset(34)
        }
        sLabel.snp.makeConstraints { make in
            make.top.equalTo(mLabel.snp.bottom).offset(7)
            make.left.equalTo(popview.snp.left).offset(64)
        }
        delButton.snp.makeConstraints { make in
            make.top.equalTo(sLabel.snp.bottom).offset(23)
            make.left.equalTo(popview.snp.left).offset(15)
            make.width.equalTo(132)
            make.height.equalTo(32)
        }
        cancelButton.snp.makeConstraints { make in
            make.top.equalTo(sLabel.snp.bottom).offset(23)
            make.left.equalTo(delButton.snp.right).offset(6)
            make.width.equalTo(132)
            make.height.equalTo(32)
        }
    }
    
    @objc func goBack(_ sender: UIButton) {
        self.mydatavc.dismiss(animated: true)
    }
    
    
    


}
