//
//  ReportInputVC.swift
//  Damso
//
//  Created by 문정호 on 2023/01/26.
//

import UIKit

class ReportInputVC: BaseVC {
    
    let reportinputView = ReportInputView()
    
    override func loadView(){
        view = reportinputView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func configure() {
        
    }
    
    override func setNavigationBar() {
        self.navigationItem.title = "흡연구역 제보하기"
    }

}
