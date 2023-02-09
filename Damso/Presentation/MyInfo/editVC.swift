//
//  editVC.swift
//  Datamy
//
//  Created by 최유빈 on 2023/01/31.
//

import UIKit

class editVC: UIViewController {

    let editview = editView()
    
    override func loadView() {
        view = editview
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
        editview.backButton.addTarget(self, action: #selector(gotoBack(_:)), for: .touchUpInside)
        configure()
        setNavigationBar()
        // Do any additional setup after loading the view.
    }
    
    func configure() {
    }
    
    func setNavigationBar() {}

    @objc func gotoBack(_ sender: UIButton) {
         self.dismiss(animated: true)
     }

    
}
