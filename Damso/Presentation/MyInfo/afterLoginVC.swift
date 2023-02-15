//
//  afterLoginVC.swift
//  LoginPage
//
//  Created by 최유빈 on 2023/02/07.
//

import UIKit
import SnapKit
import Then
import Alamofire
import SwiftyJSON

class afterLoginVC: UIViewController {
    
    var user: Int?
    var myname: String?
    var mynickname: String?
    var changenickname: String?
    var basenickname: String?
    let loginDataView = LoginDataView()
    var test: String? = nil
    
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
       
        getUserInfo()
//        checknickname(test)
        
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
    
//    func changenickname(changenickname: String?){
//        guard let changenickname = changenickname  else { return }
//        self.loginDataView.userLabel.text = changenickname
//    }
    
//    func checknickname(_ n: String?){
//        guard let changenickname = n else {
//            let realnickname = basenickname
//            return
//        }
//        let realnickname = changenickname
//    }

   @objc func goSetProfile(_ sender: UIButton) {
      // print(user!)
       let secondVC = editVC()
       self.navigationController?.pushViewController(secondVC, animated: true)
       secondVC.name = myname
       secondVC.originnickname = mynickname
       secondVC.userid = user
   }
//
//    func downsample(imageData: Data, for size: CGSize, scale:CGFloat) -> UIImage {
//            // dataBuffer가 즉각적으로 decoding되는 것을 막아줍니다.
//            let imageSourceOptions = [kCGImageSourceShouldCache: false] as CFDictionary
//            guard let imageSource = CGImageSourceCreateWithData(imageData as CFData, imageSourceOptions) else { return UIImage() }
//            let maxDimensionInPixels = max(size.width, size.height) * scale
//            let downsampleOptions =
//                [kCGImageSourceCreateThumbnailFromImageAlways: true,
//                 kCGImageSourceShouldCacheImmediately: true, //  thumbNail을 만들 때 decoding이 일어나도록 합니다.
//                 kCGImageSourceCreateThumbnailWithTransform: true,
//                 kCGImageSourceThumbnailMaxPixelSize: maxDimensionInPixels] as CFDictionary
//
//            // 위 옵션을 바탕으로 다운샘플링 된 `thumbnail`을 만듭니다.
//            guard let downsampledImage = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, downsampleOptions) else { return UIImage() }
//            return UIImage(cgImage: downsampledImage)
//    }
    
    func getUserInfo() {
        
        let userid = user!
        print(userid)
        let headers: HTTPHeaders = [
                "Content-Type": "application/json",
                "Accept": "application/json"
            ]

        let url = "http://3.37.122.59:3000/main/profile/\(userid)"
        
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding(options: []), headers: headers)
            .responseJSON { response in
                
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    let userInfo = json["result"].arrayValue[0]
                    let bufferdata = json["result"].arrayValue[1]
                    let imagebuffer = bufferdata["data"]
//                    let jsonpath = Bundle.main.url(forResource: "imagebuffer", withExtension: "json")
//                    let imagedata = try String(contentsOf: jsonpath!).data(using: .utf8)
//                    let image = try JSONSerialization.jsonObject(with: imagedata!, options: [] ) as? Data
                    let info = userInfo.arrayValue[0]
                    let nickname = info["nickname"].stringValue
                    let name = info["name"].stringValue
                    self.loginDataView.userLabel.text = nickname
                    self.mynickname = nickname
                    self.myname = name
                    
//
//                    let serialQueue = DispatchQueue(label: "Decode queue")
//                    serialQueue.async { [weak self] in
//
//                        let downsampled = downsample(
//                            imageData: image!,
//                                for: CGSize(width: 50, height: 50),
//                                scale: UIScreen.main.scale
//                            )
//                        DispatchQueue.main.async {
//                            self?.loginDataView.profileImage.image = downsampled
//                        }
//                    }
                        
                case .failure:
                    print("failure")
                }
            }
    }
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
        popup.user = self.user
        present(popup,animated: false, completion: nil)

    }
}

