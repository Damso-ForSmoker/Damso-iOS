//
//  PopupVC.swift
//  Datamy
//
//  Created by 최유빈 on 2023/01/30.
//

import UIKit
import SnapKit
import Then
import Alamofire
import SwiftyJSON

class PopupVC: UIViewController {

    let identifier = "PopupVC"
    let popupView = PopupView()
    
    var user: Int?
    
    override func loadView() {
        view = popupView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.backgroundColor = (UIColor.black.cgColor).copy(alpha:0.5)
        popupView.cancelButton.addTarget(self, action: #selector(goBack(_:)), for: .touchUpInside)
//        popupView.delButton.addTarget(self, action: #selector(deleteUser(_:)), for: .touchUpInside)
    }
    
//    @objc func deleteUser(_ sender: UIButton) {
//        let userid = user!
//        print(userid)
//        let headers: HTTPHeaders = [
//                "Content-Type": "application/json",
//                "Accept": "application/json"
//            ]
//
//        let url = "http://3.37.122.59:3000/main/profile/\(userid)/setting/resign"
//
//        AF.request(url, method: .post, parameters: nil, encoding: JSONEncoding(options: []), headers: headers)
//            .responseJSON { response in
//
//                switch response.result {
//                case .success:
//                    let secondVC = MydataVC()
//                    self.navigationController?.pushViewController(secondVC, animated: true)
//
//                case .failure:
//                    print("failure")
//                }
//            }
//
//    }
    
    func configure() {
    }
        /// 네비게이션 바 설정
        /// - 타이틀, 아이템 등 네비게이션과 관련된 설정을 합니다.
    func setNavigationBar() {}

    
    @objc func goBack(_ sender: UIButton) {
        self.dismiss(animated: false)
    }
}


