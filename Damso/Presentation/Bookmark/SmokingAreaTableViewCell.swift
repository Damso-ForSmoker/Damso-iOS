//
//  BookmarkTableViewCell.swift
//  Damso
//
//  Created by 문정호 on 2023/01/31.
//

import UIKit
import SnapKit
import Then

class SmokingAreaTableViewCell: UITableViewCell {
    
    static let identifier = "BookmarkTableViewCell"
    
    //시설 사진
    let areaImgView = UIImageView().then{
        $0.backgroundColor = .systemBackgroundColor
        $0.layer.cornerRadius = 3
        $0.image = UIImage(named: "AreaExactlyOpenImg")
        $0.contentMode = .scaleAspectFit
    }
    
    //흡연구역명 레이블
    let titleLabel = UILabel().then{
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 16)
        $0.text = "흡연구역 명"
    }
    
    //위치 레이블
    let locationLabel = UILabel().then{
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 10)
        $0.text = "위치"
    }
    
    //별 이미지
    let starImg = UIImageView().then{
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(systemName: "star.fill")
        $0.tintColor = .yellow
    }
    
    //점수 레이블
    let scoreLabel = UILabel().then{
        $0.text = "3.7"
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 12)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    //MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //func configure(){ }
    
    //MARK: - setUpUI
    func setUpUI(){
        contentView.addSubview(areaImgView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(locationLabel)
        contentView.addSubview(scoreLabel)
        contentView.addSubview(starImg)
    }
    
    
    //MARK: - setConstraints
    
    func setConstraints(){
        areaImgView.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview().inset(10) //TableView.AutomaticDimension을 적용하기 위해서 bottom Constraints까지 꼭 적용 해주어야 한다.
            make.leading.equalToSuperview().inset(5)
            make.height.width.equalTo(40)
        }
        titleLabel.snp.makeConstraints{ make in
            make.top.equalTo(areaImgView.snp.top)
            make.leading.equalTo(areaImgView.snp.trailing).offset(8)
        }
        locationLabel.snp.makeConstraints{ make in
            make.bottom.equalTo(areaImgView.snp.bottom)
            make.leading.equalTo(areaImgView.snp.trailing).offset(8)
        }
        scoreLabel.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().inset(8)
            make.top.equalTo(areaImgView)
        }
        starImg.snp.makeConstraints{ make in
            make.top.equalTo(areaImgView)
            make.trailing.equalTo(scoreLabel.snp.leading)
            make.height.width.equalTo(19)
        }
        
        
    }
}
