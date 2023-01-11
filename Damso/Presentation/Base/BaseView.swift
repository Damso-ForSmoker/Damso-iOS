//
//  BaseView.swift
//  Damso
//
//  Created by 문정호 on 2023/01/10.
//

import UIKit

/// 베이스 뷰
/// - 이 뷰에서 화면에 보여지는 UI 처리를 합니다.
class BaseView: UIView {
    
    /// 베이스 뷰 이니셜라이저
    /// - 자동으로 setupUI(), setupConstraints()를 호출하므로 BaseView를 상속받은 커스텀뷰는 두 메서드를 오버라이딩하여 사용하면 됩니다.
    /// - VC의 loadView() 메서드를 오버라이딩후 super 메서드를 호출하지 않고 view = 커스텀뷰()로 바꿔주어야 합니다.
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground

        setupUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    /// UI 설정
    /// - addSubviews를 하거나 뷰의 배경색을 바꾸는 등 설정을 합니다.
    func setupUI() {}
    
    /// UI 제약조건 설정
    /// - Anchor, Snapkit 등을 이용해 UI 컴포넌트의 위치, 크기 등 제약조건을 설정합니다.
    func setConstraints() {}
    
}
