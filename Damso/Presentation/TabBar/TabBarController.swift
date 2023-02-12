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
        //우리 프로젝트의 모든 rootView는 NavigationController를 사용하기 때문에 UINavigationController를 인스턴스 하면 됩니다.
        let report = UINavigationController(rootViewController: ReportVC())
        let bookmark = UINavigationController(rootViewController: BookmarkVC())
        let main = UINavigationController(rootViewController: MainViewController())
        let search = UINavigationController(rootViewController: SearchVC())
        let myInfo = UINavigationController(rootViewController: MydataVC())

        //UITabBarItem 인스턴스를 생성시킨 다음, ViewController의 tabBarItem property에 할당하면 됩니다.
        report.tabBarItem = UITabBarItem(title: "제보하기", image: UIImage(systemName: "plus.circle"), selectedImage: UIImage(systemName: "plus.circle")?.withTintColor(.blue))
        bookmark.tabBarItem = UITabBarItem(title: "즐겨찾기", image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart.fill"))
        main.tabBarItem = UITabBarItem(title: "메인", image: UIImage(named: "HomeIcon"), selectedImage: UIImage(named: "HomeIconSelected"))
        search.tabBarItem = UITabBarItem(title: "주변", image: UIImage(named: "SearchIcon"), selectedImage: UIImage(named: "SearchIcon")?.withTintColor(.blue))
        myInfo.tabBarItem = UITabBarItem(title: "내 정보", image: UIImage(named: "MyInfo"), selectedImage:UIImage(named: "MyInfo") )
        
        
        //TabBarController에 ViewController를 포함시킴
        //viewController 변수에 직접 접근해도 됩
        self.setViewControllers([main, search, report, bookmark, myInfo], animated: false)
        
        self.tabBar.backgroundColor = .white //TabBar의 색을 하얀색으로 설정
    }
    



}
