//
//  SearchTypeView.swift
//  Damso
//
//  Created by 문정호 on 2023/02/12.
//

import UIKit
import Then
import SnapKit

class SearchTypeView: BaseView {
    //MARK: - Properties
    var imgConfiguration = UIButton.Configuration.plain()
    
    let typeTitle = UILabel().then{ //시설 형태 라벨
        $0.text = "시설형태"
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 16)
    }
    
    lazy var stackView = UIStackView().then{
        $0.axis = .horizontal
        $0.spacing = 10
        $0.distribution = .fillEqually //똑같은 스페이스를 둠
        $0.alignment = .fill //정렬 수직 방향은 무조건 채움
    }
    
    let exactlyOpenButton = UIButton(configuration: UIButton.Configuration.gray()).then{ //완전 개방형 버튼
        $0.configuration?.image = UIImage(named: "AreaExactlyOpenImg")
        $0.configuration?.imagePadding = 10
        $0.configuration?.imagePlacement = .top
        $0.layer.cornerRadius = 10
    }
    let openButton = UIButton(configuration: UIButton.Configuration.gray()).then{ //완전 개방형 버튼
        $0.setImage(UIImage(named: "AreaOpenImg"), for: .normal)
        $0.configuration?.imagePadding = 0
        $0.configuration?.imagePlacement = .top
        $0.layer.cornerRadius = 10
    }
    let closedButton = UIButton(configuration: UIButton.Configuration.gray()).then{ //완전 개방형 버튼
        $0.setImage(UIImage(named: "AreaclosedImg"), for: .normal)
        $0.configuration?.imagePadding = 0
        $0.configuration?.imagePlacement = .top
        $0.layer.cornerRadius = 10
    }
    let exactlyClosedButton = UIButton(configuration: UIButton.Configuration.gray()).then{ //완전 개방형 버튼
        $0.configuration?.subtitle = "완전 폐쇄형"
        $0.setImage(UIImage(named: "AreaExactlyClosedImg"), for: .normal)
        $0.configuration?.imagePadding = 0
        $0.configuration?.imagePlacement = .top
        $0.layer.cornerRadius = 10
    }
    
    let searchButton = UIButton(configuration: UIButton.Configuration.filled()).then{
        $0.configuration?.title = "검색"
        $0.configuration?.cornerStyle = .capsule
        $0.configuration?.baseBackgroundColor = .primaryColor
    }
    
    //MARK: - SetupUI
    override func setupUI() {
        self.addSubview(typeTitle)
        self.stackView.addArrangedSubview(exactlyOpenButton)
        self.stackView.addArrangedSubview(openButton)
        self.stackView.addArrangedSubview(closedButton)
        self.stackView.addArrangedSubview(exactlyClosedButton)
        self.addSubview(stackView)
        self.addSubview(searchButton)
        setButtonUI()
    }
    
    //MARK: - SetConstraints
    override func setConstraints() {
        typeTitle.snp.makeConstraints{make in
            make.leading.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(58)
        }
        stackView.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(typeTitle.snp.bottom).offset(12)
            make.height.equalTo(70)
        }
        searchButton.snp.makeConstraints{make in
            make.top.equalTo(stackView.snp.bottom).offset(26)
            make.trailing.leading.equalToSuperview().inset(109)
            make.height.equalTo(44)
        }
    }
    
    //MARK: - Helper
    func setButtonUI(){ //버튼 UI를 세팅합니다.
        var container = AttributeContainer()
        container.font = UIFont(name: "NotoSansKR-Regular", size: 10)
        container.foregroundColor = UIColor.darkGray
        self.exactlyOpenButton.configuration?.attributedTitle = AttributedString("완전 개방형", attributes: container)
        self.openButton.configuration?.attributedSubtitle = AttributedString("개방형", attributes: container)
        self.closedButton.configuration?.attributedSubtitle = AttributedString("폐쇄형", attributes: container)
        self.exactlyClosedButton.configuration?.attributedSubtitle = AttributedString("완전 폐쇄형", attributes: container)
    }
}
