//
//  LoginView.swift
//  LoginPage
//
//  Created by 최유빈 on 2023/01/30.
//

import UIKit
import SnapKit
import Then


class LoginView: UIView {

    let logoImage = UIImageView().then {
        $0.image = UIImage(named: "logo")
 //       $0.frame = CGRect(x: 0, y: 0, width: 260, height: 194)
    }
    
    let logoLabel = UILabel().then {
        $0.text = "건전한 흡연 문화의 안내자"
        $0.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        $0.font = UIFont(name: "NotoSans-SemiBold", size: 14)
        $0.textAlignment = .center
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupUI()
        setConstraints()
    }
        
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupUI() {
        self.backgroundColor = .white
        self.addSubview(logoImage)
        self.addSubview(logoLabel)

    }
    
    func setConstraints() {
        logoImage.snp.makeConstraints { make in
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.top.equalToSuperview().offset(47)
            make.width.equalTo(260)
            make.height.equalTo(194)
        }
        
        logoLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(183)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.width.equalTo(246)
            make.height.equalTo(28)
        }

    }
    
    

    

}
