//
//  infoTableViewCell.swift
//  Datamy
//
//  Created by 최유빈 on 2023/01/29.
//

import UIKit
import SnapKit
import Then

protocol infoTableViewDelegate: AnyObject {
    func buttonTapped()
}
class infoTableViewCell: UITableViewCell {
    static let identifier = "infoTableViewCell"
    
    var cellDelegate: infoTableViewDelegate?

    var leftLabel = UILabel().then {
        $0.font = UIFont(name: "NotoSans-Regular", size: 16)
    }

    var rightButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "chevron-right"), for: .normal)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(leftLabel)
        contentView.addSubview(rightButton)
        setConstraints()
        
        self.rightButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been impl")
    }
    
    func setConstraints() {
        leftLabel.snp.makeConstraints { make in
            make.width.equalTo(250)
            make.left.equalTo(contentView).offset(18)
            make.centerY.equalTo(contentView)
        }
        rightButton.snp.makeConstraints { make in
            make.right.equalTo(safeAreaLayoutGuide.snp.right).inset(14)
            make.centerY.equalTo(contentView)
            make.width.height.equalTo(22)
        }
    }
    
    @objc func buttonClicked() {
        cellDelegate?.buttonTapped()
    }
}

extension infoTableViewCell {
    public func bind(model: infoCellModel){
        leftLabel.text = model.leftTitle
    }
}

