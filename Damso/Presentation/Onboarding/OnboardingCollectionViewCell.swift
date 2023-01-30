//
//  OnboardingCollectionViewCell.swift
//  Damso
//
//  Created by 문정호 on 2023/01/19.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    static let identifier = "OnboardingCollectionViewCell"
    
    let imgView = UIImageView().then{
        $0.contentMode = .scaleAspectFill
    }
    let titleLabel = UILabel().then {
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 24)
        $0.textAlignment = .center
    }
    let descriptionLabel = UILabel().then{
        $0.numberOfLines = 2
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 14)
        $0.textAlignment = .center
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ message: OnboardingMessage) {
        imgView.image = UIImage(named: message.imgName)
        titleLabel.text = message.title
        descriptionLabel.text = message.description
    }
    
    func setUI(){
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(imgView)
    }
    
    func setConstraints(){
        imgView.snp.makeConstraints{ make in
            make.top.equalTo(contentView)
            make.leading.equalTo(contentView).offset(28)
            make.trailing.equalTo(contentView.snp.trailing).inset(40)
            make.height.equalTo(imgView.snp.width).multipliedBy(1)
        }
        titleLabel.snp.makeConstraints{ make in
            make.top.equalTo(imgView.snp.bottom)
            make.leading.equalTo(contentView.snp.leading).inset(39)
            make.trailing.equalTo(contentView.snp.trailing).inset(40)
        }
        descriptionLabel.snp.makeConstraints{ make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.leading.equalTo(titleLabel.snp.leading)
            make.trailing.equalTo(titleLabel.snp.trailing)
        }
    }
}
