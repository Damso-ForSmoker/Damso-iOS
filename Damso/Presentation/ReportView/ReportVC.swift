//
//  ReportVC.swift
//  Damso
//
//  Created by 문정호 on 2023/01/17.
//

import UIKit

class ReportVC: BaseVC {
    
    let reportView = ReportView()
    
    override func loadView() {
        self.view = reportView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
