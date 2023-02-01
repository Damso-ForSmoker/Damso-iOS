//
//  BookmarkIsEmptyCell.swift
//  Damso
//
//  Created by 문정호 on 2023/01/31.
//

import UIKit
import SnapKit
import Then

class BookmarkIsEmptyCell: UITableViewCell {
    
    static let identifier = "BookmarkIsEmptyCell"
    
    let imgView = UIImageView(image: UIImage(systemName: "heart"))
    
    let mainLabel = UILabel().then{
        $0.text = "아직 즐겨찾기가 없어요."
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 16)
    }

    let subLabel = UILabel().then{
        $0.text = "하트를 눌러 마음에 드는 구역을 찜해보세요."
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 10)
    }
    //MARK: - awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    

    //MARK: - setSelected
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    //MARK: - init
    
    //초기화
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //MARK: - setUI
    
    func setUI(){
        contentView.addSubview(imgView)
        contentView.addSubview(mainLabel)
        contentView.addSubview(subLabel)
    }
    
    
    //MARK: - setConstraints
    
    func setConstraints(){
        imgView.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-10)
        }
        mainLabel.snp.makeConstraints{ make in
            make.top.equalTo(imgView.snp.bottom).offset(16)
            make.centerX.equalTo(imgView.snp.centerX)
        }
        subLabel.snp.makeConstraints{ make in
            make.centerX.equalTo(imgView.snp.centerX)
            make.top.equalTo(mainLabel.snp.bottom)
        }
    }
    

}
