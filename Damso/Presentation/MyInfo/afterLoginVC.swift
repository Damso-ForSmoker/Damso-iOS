//
//  afterLoginVC.swift
//  LoginPage
//
//  Created by 최유빈 on 2023/02/07.
//

import UIKit
import SnapKit
import Then

class afterLoginVC: UIViewController {
    
    
    let loginDataView = LoginDataView()
    
    let titleLabel = UILabel().then {
        $0.text = "내 정보"
        $0.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 20)
        $0.sizeToFit()
    }
    
    let setButton = UIButton().then {
        $0.setImage(UIImage(named: "Vector"), for: .normal)
    }
    
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(view)
            make.top.equalTo(loginDataView.setLabel.snp.bottom).offset(2)
            
        }
    return tableView
    }()

        var dataSource = [secondinfoCellModel]()
  
    override func loadView() {
        view = loginDataView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.view.addSubview(setButton)
        setButton.addTarget(self, action: #selector(goSetProfile(_:)), for: .touchUpInside)
       
//        getInfoData()
        configure()
        setNavigationBar()
        setupView()
        loadData()
    }
        /// Delegate, Register, AddTarget 등
    func configure() {
    }
        
        /// 네비게이션 바 설정
        /// - 타이틀, 아이템 등 네비게이션과 관련된 설정을 합니다.
    func setNavigationBar() {
        self.navigationItem.hidesBackButton = true
        self.navigationItem.titleView = titleLabel
    }
    

    func setupView() {
      setButton.snp.makeConstraints { make in
            make.top.equalTo(loginDataView.loginView.snp.top).offset(8)
          make.right.equalTo(loginDataView.loginView.snp.right).inset(15)
            make.width.height.equalTo(12)
        }
        
        
        tableView.register(secondinfoTableViewCell.self, forCellReuseIdentifier: secondinfoTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }

    func loadData() {
        dataSource.append(.init(leftTitle: "이용 문의"))
        dataSource.append(.init(leftTitle: "이용 약관"))
        dataSource.append(.init(leftTitle: "개인정보 처리 방침"))
        dataSource.append(.init(leftTitle: "회원 탈퇴"))
        tableView.reloadData()
    }

   @objc func goSetProfile(_ sender: UIButton) {
       let secondVC = editVC()
       self.navigationController?.pushViewController(secondVC, animated: true)
 }
    
//    func getInfoData() {
//        GetInfoService.shared.getInfo { (response) in
//
//            switch(response) {
//
//            case .success(let personData):
//
//                if let data = personData as? MyInfo {
//                    self.loginDataView.userLabel.text = data.nickname
//                    self.loginDataView.profileImage.image = UIImage(named: data.profile)
//                }
//
//            case .requestErr(let message) :
//                print("requestErr", message)
//            case .pathErr :
//                print("pathErr")
//            case .serverErr :
//                print("serverErr")
//            case .networkFail :
//                print("networkFail")
//            }
//        }
//    }

}

struct secondinfoCellModel {
    let leftTitle: String
}

extension afterLoginVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: secondinfoTableViewCell.identifier) as? secondinfoTableViewCell ?? secondinfoTableViewCell()
        cell.bind(model: dataSource[indexPath.row])
        
        cell.cellDelegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
}

extension afterLoginVC: secondinfoTableViewDelegate{
    func buttonTapped() {

        let popup = PopupVC()
        popup.modalPresentationStyle = .overFullScreen
        present(popup,animated: false, completion: nil)

    }
}

