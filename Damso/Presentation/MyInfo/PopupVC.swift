//
//  PopupVC.swift
//  Datamy
//
//  Created by 최유빈 on 2023/01/30.
//

import UIKit
import SnapKit
import Then

class PopupVC: UIViewController {

    let identifier = "PopupVC"
    let popupView = PopupView()
    
    override func loadView() {
        view = popupView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.backgroundColor = (UIColor.black.cgColor).copy(alpha:0.5)
        popupView.cancelButton.addTarget(self, action: #selector(goBack(_:)), for: .touchUpInside)
    }
    
    func configure() {
      //  popupView.cancelButton.addTarget(self, action: #selector(goBack(_:)), for: .touchUpInside)
    }
        /// 네비게이션 바 설정
        /// - 타이틀, 아이템 등 네비게이션과 관련된 설정을 합니다.
    func setNavigationBar() {}

    
    @objc func goBack(_ sender: UIButton) {
        self.dismiss(animated: false)
    }
}


