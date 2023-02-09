//
//  MydataVC.swift
//  
//
//  Created by 최유빈 on 2023/01/22.
//

import UIKit
import SnapKit
import Then

class MydataVC: UIViewController {
    
    let mydataView = MydataView()
  //  let loginDataView = LoginDataView()
    
 //   let setButton = UIButton().then {
 //       $0.setImage(UIImage(named: "Vector"), for: .normal)
 //   }
    
    let loginButton = UIButton().then {
            $0.setTitle("로그인 하러 가기", for: .normal)
            $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
            $0.setTitleColor(UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1), for: .normal)
            $0.setUnderline()
        }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(view)
            make.top.equalTo(mydataView.setLabel.snp.bottom).offset(2)
            
        }
    return tableView
    }()

        var dataSource = [infoCellModel]()
  
    override func loadView() {
        view = mydataView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
   //     self.view.addSubview(loginDataView)
     //   self.view.addSubview(setButton)
     //   setButton.addTarget(self, action: #selector(goSetProfile(_:)), for: .touchUpInside)
       
     //   self.view.addSubview(mydataView)
        self.view.addSubview(loginButton)
        
        loginButton.addTarget(self, action: #selector(goLogin(_:)), for: .touchUpInside)
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
    func setNavigationBar() {}
    

    func setupView() {
/*        setButton.snp.makeConstraints { make in
            make.top.equalTo(loginDataView.loginView.snp.top).offset(8)
            make.left.equalToSuperview().offset(363)
            make.width.height.equalTo(12)
        } */
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(mydataView.notLoginView.snp.top).offset(125)
            make.left.equalTo(mydataView.notLoginView.snp.left).offset(143)
            make.width.equalTo(106)
            make.height.equalTo(19)
        }
        
        tableView.register(infoTableViewCell.self, forCellReuseIdentifier: infoTableViewCell.identifier)
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
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "editVC") else {return}
        uvc.modalPresentationStyle = .fullScreen //전체화면으로 보이게 설정
        // vcName?.modalTransitionStyle = .crossDissolve //전환 애니메이션 설정
        self.present(uvc, animated: true)
 }
    
    @objc func goLogin(_ sender: UIButton) {
         guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") else {return}
         uvc.modalPresentationStyle = .fullScreen //전체화면으로 보이게 설정
         // vcName?.modalTransitionStyle = .crossDissolve //전환 애니메이션 설정
         self.present(uvc, animated: true)
  }

}

struct infoCellModel {
    let leftTitle: String
}

extension MydataVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: infoTableViewCell.identifier) as? infoTableViewCell ?? infoTableViewCell()
        cell.bind(model: dataSource[indexPath.row])
        
        cell.cellDelegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
}

extension MydataVC: infoTableViewDelegate{
    func buttonTapped() {

        let popup = PopupVC()
        popup.modalPresentationStyle = .overFullScreen
        present(popup,animated: false, completion: nil)
        

    }
}

extension UIButton {
    func setUnderline() {
        guard let title = title(for: .normal) else {return}
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue,
                                      range: NSRange(location: 0, length: title.count))
        
        setAttributedTitle(attributedString, for: .normal)
    }
}
