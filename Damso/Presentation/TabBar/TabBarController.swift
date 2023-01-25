//
//  TabBarController.swift
//  Damso
//
//  Created by 문정호 on 2023/01/24.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //인스턴스를 생성 시켜 연결시키시면 됩니다.
        //let main
        let Report = ReportVC()
        Report.tabBarItem = UITabBarItem(title: "제보하기", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        self.viewControllers = [Report]
    }
    
    //MARK: - SetUI
    
    func SetUI(){
        
    }
    



}
