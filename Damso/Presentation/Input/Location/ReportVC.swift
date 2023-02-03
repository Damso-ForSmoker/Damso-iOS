//
//  ReportVC.swift
//  Damso
//
//  Created by 문정호 on 2023/01/17.
//

import UIKit

class ReportVC: BaseVC {
    
    let reportView = ReportView()
    let nextVC = ReportInputVC()
    
    //MARK: - loadView
    override func loadView() {
        self.view = reportView
    }
    
    //MARK: - configure
    override func configure(){
        reportView.reportButton.addTarget(self, action: #selector(tappedReportButton(_:)), for: .touchUpInside)
    }
    
    
    //MARK: - setNavigation
    override func setNavigationBar() {
        self.navigationItem.title = "흡연구역 제보하기"
        self.navigationController?.navigationBar.backgroundColor = .white
        let backButtonItem = UIBarButtonItem(title: nil, style: .plain, target: self, action: nil)
        backButtonItem.tintColor = .black
        self.navigationItem.backBarButtonItem = backButtonItem
    }
    
    //MARK: - Helper
    @objc func tappedReportButton(_ sender: UIButton){
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
