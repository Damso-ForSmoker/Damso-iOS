//
//  ReportInputView.swift
//  Damso
//
//  Created by 문정호 on 2023/01/27.
//

import UIKit
import SnapKit
import Then

class ReportInputView: BaseView {
    //MARK: - Properties
    let scrollView = UIScrollView().then{
        $0.backgroundColor = .white
        $0.showsHorizontalScrollIndicator = false
    }
    let contentView = UIView()
    let locationTitle = UILabel().then{
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 15)
        $0.textColor = .black
        $0.text = "지정한 위치 *"
    }

    let locationTextField = UIView().then{
        $0.backgroundColor = .systemBackgroundColor
        $0.layer.cornerRadius = 15
    }
    
    var locationLabel = UILabel().then{
        $0.adjustsFontSizeToFitWidth = true
        $0.font = UIFont(name: "NotoSansKR-Medium", size: 17)
        $0.textColor = .black
    }
    let nameLabel = UILabel().then{
        $0.text = "흡연구역 이름 *"
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 15)
        $0.textColor = .black
    }
    let nameTextField = UITextField().then {
        $0.backgroundColor = .systemBackgroundColor
        $0.layer.cornerRadius = 15
    }
    
    let classificationLabel = UILabel().then {
        $0.text = "시설 형태 *"
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 15)
        $0.textColor = .black
    }
    
    let exactlyOpenButton = UIButton().then{
        $0.setTitle("완전 개방형", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.adjustsFontSizeToFitWidth = true
        $0.setImage(UIImage(systemName: "square"), for: .normal)
        $0.setImage(UIImage(systemName: "checkmark.square"), for: .selected)
        $0.tintColor = .black
        $0.backgroundColor = .clear
    }
    let OpenButton = UIButton().then{
        $0.setTitle("개방형", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.adjustsFontSizeToFitWidth = true
        $0.setImage(UIImage(systemName: "square"), for: .normal)
        $0.setImage(UIImage(systemName: "checkmark.square"), for: .selected)
        $0.tintColor = .black
        $0.backgroundColor = .clear
    }
    
    let closedButton = UIButton().then {
        $0.setTitle("폐쇄형", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.adjustsFontSizeToFitWidth = true
        $0.setImage(UIImage(systemName: "square"), for: .normal)
        $0.setImage(UIImage(systemName: "checkmark.square"), for: .selected)
        $0.tintColor = .black
        $0.backgroundColor = .clear
    }
    
    let exactolyClosedButton = UIButton().then{
        $0.setTitle("완전 폐쇄형", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.adjustsFontSizeToFitWidth = true
        $0.setImage(UIImage(systemName: "square"), for: .normal)
        $0.setImage(UIImage(systemName: "checkmark.square"), for: .selected)
        $0.tintColor = .black
        $0.backgroundColor = .clear
    }
    
    let supervisorLabel = UILabel().then{
        $0.text = "설치 주체"
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 15)
        $0.textColor = .black
    }
    let supervisorTextField = UITextField().then{
        $0.backgroundColor = .systemBackgroundColor
        $0.layer.cornerRadius = 15
    }
    let imgLabel = UILabel().then{
        $0.text = "시설 사진"
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 15)
        $0.textColor = .black
    }
    
    let imgView = UIImageView().then{
        $0.backgroundColor = .systemBackgroundColor
    }
    let uploadButton = UIButton().then{
        $0.setTitle("사진 업로드", for: .normal)
        $0.layer.cornerRadius = 10
        $0.titleLabel?.font = UIFont(name: "NotoSansKR-Bold", size: 11)
        $0.backgroundColor = .systemBackgroundColor
        $0.setTitleColor(.black, for: .normal)
    }
    
    let reportButton = UIButton().then {
        $0.titleLabel?.font = UIFont(name: "NotoSansKR-Medium", size: 17)
        $0.layer.cornerRadius = 17
        $0.setTitle("제보하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .primaryColor
    }
    
    lazy var classificationButton = [exactlyOpenButton, OpenButton, closedButton, exactolyClosedButton]
    
    lazy var stackV = UIStackView().then{
        $0.addArrangedSubview(exactlyOpenButton)
        $0.addArrangedSubview(OpenButton)
        $0.addArrangedSubview(closedButton)
        $0.addArrangedSubview(exactolyClosedButton)
        $0.axis = .horizontal
        $0.spacing = 10
        $0.distribution = .fillEqually
        $0.alignment = .fill
    }
    
    //MARK: - setupUI
    override func setupUI(){
        self.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        self.contentView.addSubview(locationTitle)
        self.contentView.addSubview(locationTextField)
        locationTextField.addSubview(locationLabel)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(nameTextField)
        self.contentView.addSubview(classificationLabel)
        self.contentView.addSubview(stackV)
        self.contentView.addSubview(supervisorLabel)
        self.contentView.addSubview(supervisorTextField)
        self.contentView.addSubview(imgLabel)
        self.contentView.addSubview(imgView)
        self.contentView.addSubview(uploadButton)
        self.contentView.addSubview(reportButton)
    }
    
    //MARK: - setConstraints
    override func setConstraints(){
        scrollView.snp.makeConstraints{ make in
            make.top.bottom.trailing.leading.equalTo(safeAreaLayoutGuide)
        }
        contentView.snp.makeConstraints{ make in
            make.top.bottom.trailing.leading.equalToSuperview()
            make.width.equalToSuperview()
        }
        locationTitle.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(5)
            make.leading.equalToSuperview().inset(13)
        }
        locationTextField.snp.makeConstraints{ make in
            make.top.equalTo(locationTitle.snp.bottom).offset(7)
            make.trailing.leading.equalToSuperview().inset(13)
            make.height.equalTo(50)
        }
        locationLabel.snp.makeConstraints{ make in
            make.trailing.leading.top.bottom.equalToSuperview().inset(10)
        }
        nameLabel.snp.makeConstraints{ make in
            make.top.equalTo(locationTextField.snp.bottom).offset(30)
            make.leading.equalTo(locationTitle)
        }
        nameTextField.snp.makeConstraints{ make in
            make.top.equalTo(nameLabel.snp.bottom).offset(7)
            make.leading.trailing.equalToSuperview().inset(13)
            make.height.equalTo(50)
        }
        classificationLabel.snp.makeConstraints{ make in
            make.top.equalTo(nameTextField.snp.bottom).offset(30)
            make.leading.equalTo(locationTitle)
        }
        stackV.snp.makeConstraints{ make in
            make.top.equalTo(classificationLabel.snp.bottom).offset(7)
            make.leading.trailing.equalToSuperview().inset(13)
            make.height.equalTo(50)
        }
        supervisorLabel.snp.makeConstraints{ make in
            make.top.equalTo(stackV.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(13)
        }
        supervisorTextField.snp.makeConstraints{ make in
            make.top.equalTo(supervisorLabel.snp.bottom).offset(7)
            make.leading.trailing.equalToSuperview().inset(13)
            make.height.equalTo(50)
        }
        imgLabel.snp.makeConstraints{ make in
            make.top.equalTo(supervisorTextField.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(13)
        }
        imgView.snp.makeConstraints{ make in
            make.leading.equalToSuperview().inset(13)
            make.top.equalTo(imgLabel.snp.bottom).offset(7)
            make.width.equalTo(113)
            make.height.equalTo(imgView.snp.width)
        }
        uploadButton.snp.makeConstraints{ make in
            make.centerY.equalTo(imgView.snp.centerY)
            make.leading.equalTo(imgView.snp.trailing).offset(15)
            make.trailing.equalToSuperview().inset(15)
        }
        reportButton.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imgView.snp.bottom).offset(28)
            make.bottom.equalToSuperview().inset(28)
            make.trailing.leading.equalToSuperview().inset(110)
        }
        
    }

}
