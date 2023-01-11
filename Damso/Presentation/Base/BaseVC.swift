//
//  BaseVC.swift
//  Damso
//
//  Created by 문정호 on 2023/01/10.
//

import UIKit

/// 베이스 뷰 컨트롤러
/// - loadView() 메서드를 오버라이드한 후 view를 커스텀 뷰로 교체해줄 수 있다.
class BaseVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        setNavigationBar()

    }
    /// Delegate, Register, AddTarget 등
    func configure() {}
    
    /// 네비게이션 바 설정
    /// - 타이틀, 아이템 등 네비게이션과 관련된 설정을 합니다.
    func setNavigationBar() {}



}

