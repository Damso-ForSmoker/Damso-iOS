//
//  editVC.swift
//  Datamy
//
//  Created by 최유빈 on 2023/01/31.
//

import UIKit
import Alamofire
import SwiftyJSON
import Then
import SnapKit

class editVC: UIViewController {

    let editview = editView()
    let logindataview = LoginDataView()
    
    var userid: Int?
    var originnickname: String?
    var name: String?
    var nickname: String?
    
    let titleLabel = UILabel().then {
        $0.text = "내 정보 수정"
        $0.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 20)
        $0.sizeToFit()
    }
    
    let nameWrite = UITextField().then {
        $0.layer.backgroundColor = UIColor(red: 0.942, green: 0.942, blue: 0.942, alpha: 0.5).cgColor
        $0.layer.cornerRadius = 15
    }
    
    let editButton = UIButton().then {
        $0.setTitle("수정하기", for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 17)
        $0.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        $0.layer.backgroundColor = UIColor(red: 0.259, green: 0.522, blue: 0.957, alpha: 1).cgColor
        $0.layer.cornerRadius = 24
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
         self.view.endEditing(true)
   }
    
    override func loadView() {
        view = editview
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(nameWrite)
        self.view.addSubview(editButton)
       // print(name!)
      //  print(originnickname!)
        setUI()
        configure()
        setNavigationBar()
        // Do any additional setup after loading the view.
    }
    
    func configure() {
        nameWrite.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        editButton.addTarget(self, action: #selector(edit(_:)), for: .touchUpInside)
        
    }
    
    func setNavigationBar() {
        self.navigationItem.titleView = titleLabel
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
        
    }
    
    func setUI(){
        nameWrite.snp.makeConstraints { make in
            make.top.equalTo(editview.namesetLabel.snp.bottom).offset(9)
            make.left.equalTo(editview.namesetLabel.snp.left)
            make.height.equalTo(40)
            make.right.equalToSuperview().inset(22)
        }
        
        editButton.snp.makeConstraints { make in
            make.centerX.equalTo(editview.safeAreaLayoutGuide.snp.centerX)
            make.bottom.equalTo(editview.safeAreaLayoutGuide.snp.bottom).offset(-37)
            make.width.equalTo(172)
            make.height.equalTo(44)
        }

    }
    
    
    @objc func textFieldDidChange(_ sender: Any?) {
        nickname = self.nameWrite.text
    }
    
    @objc func edit(_ sender: UIButton){
//        let secondVC = afterLoginVC()
//        self.navigationController?.pushViewController(secondVC, animated: true)
//        secondVC.changenickname = nickname
//        secondVC.user = userid
//        print(nickname!)
//
        let userId = userid!
        let headers: HTTPHeaders = [
//           "nickname":"\(nickname!)", "name":"\(name!)",
                "Content-Type": "application/json",
                "Accept": "application/json"
            ]

       let params = ["nickname":"\(originnickname!)", "name":"\(name!)"] as Dictionary
        let url = "http://3.37.122.59:3000/main/profile/\(userId)/nickname"

        AF.request(url, method: .post, parameters: params
                , encoding: JSONEncoding(options: []), headers: headers)
            .responseJSON { response in

                switch response.result {
                case .success(let data):
                    let secondVC = afterLoginVC()
                    self.navigationController?.pushViewController(secondVC, animated: true)
                    secondVC.user = userId
                case .failure:
                    print("failure")
                }
            }
    }

    

    
}
