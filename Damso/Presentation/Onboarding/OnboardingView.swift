//
//  OnboardingView.swift
//  Damso
//
//  Created by 문정호 on 2023/01/18.
//

import UIKit
import SnapKit
import Then

class OnboardingView: BaseView {
    //MARK: - Properties
    let identifier = "OnboardingView"
    
    let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then { //CollectionView
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal //CollectionView scroll 방향을 수평으로 설정합니다.
        $0.decelerationRate = .fast //사용자가 손가락을 뗀 후 감속 비율을 결정하는 부동 소수점 값입니다. -> 빠르게 설정
        $0.collectionViewLayout = layout
        $0.backgroundColor = .clear //collectionView의 배경을 투명하게 만듭니다.
        $0.showsHorizontalScrollIndicator = false //collectionView의 스크롤바가 보이지 않게 설정합니다.
    }
    
    var nextButton = UIButton().then {
        $0.isHidden = false
        $0.layer.cornerRadius = 20
        $0.backgroundColor = .primaryColor
        $0.setTitle("다음", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.textAlignment = .center
        $0.titleLabel?.font = UIFont(name: "NotoSansKR-Regular", size: 19)
    }
    
    let skipButton = UIButton().then {
        $0.isHidden = false
        $0.setTitle("건너뛰기", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont(name: "NotoSansKR-Regular", size: 14)
        $0.backgroundColor = .clear
    }
    
    
    //MARK: - setupUI
    override func setupUI() {
        self.backgroundColor = .white
        self.addSubview(collectionView)
        self.addSubview(nextButton)
        self.addSubview(skipButton)
        skipButton.setUnderlined()
    }
    
    //MARK: - setConstraints()
    
    override func setConstraints() {
        collectionView.snp.makeConstraints{ make in
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).inset(100)
            make.height.equalTo(safeAreaLayoutGuide.snp.height).multipliedBy(0.6)
        }
        nextButton.snp.makeConstraints{ make in
            make.trailing.leading.equalTo(safeAreaLayoutGuide).inset(109)
            make.top.equalTo(collectionView.snp.bottom)
            make.bottom.equalTo(skipButton.snp.top).inset(6)
        }
        skipButton.snp.makeConstraints{ make in
            make.trailing.equalTo(nextButton.snp.trailing)
            make.leading.equalTo(nextButton.snp.leading)
            make.top.equalTo(nextButton.snp.bottom).inset(6)
        }
    }
}
