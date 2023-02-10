//
//  editVC.swift
//  Datamy
//
//  Created by 최유빈 on 2023/01/31.
//

import UIKit

class editVC: UIViewController {

    let editview = editView()
    
    let titleLabel = UILabel().then {
        $0.text = "내 정보 수정"
        $0.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 20)
        $0.sizeToFit()
    }
    
    override func loadView() {
        view = editview
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
        configure()
        setNavigationBar()
        // Do any additional setup after loading the view.
    }
    
    func configure() {
    }
    
    func setNavigationBar() {
        self.navigationItem.titleView = titleLabel
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
        
    }


    
}
