//
//  LoginVC.swift
//  LoginPage
//
//  Created by 최유빈 on 2023/01/30.
//

import UIKit
import SnapKit
import Then
import KakaoSDKUser
import KakaoSDKAuth
import KakaoSDKCommon
import NaverThirdPartyLogin
import Alamofire
class LoginVC: UIViewController {

    let loginView = LoginView()
    
    let naverLoginInstance = NaverThirdPartyLoginConnection.getSharedInstance()
    
    let kakaoLoginButton = UIButton().then {
        $0.layer.cornerRadius = 15
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 0.658, green: 0.658, blue: 0.658, alpha: 0.7).cgColor
        
        $0.setTitle("카카오톡으로 로그인", for: .normal)
        $0.titleLabel?.font = UIFont(name: "RobotoCondensed-Regular", size: 17)
        $0.setTitleColor( UIColor(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        
        $0.setImage(UIImage(named: "kakao"), for: .normal)
        $0.contentVerticalAlignment = .center
        $0.contentHorizontalAlignment = .center
    }
    
    let appleLoginButton = UIButton().then {
        $0.layer.cornerRadius = 15
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 0.658, green: 0.658, blue: 0.658, alpha: 0.7).cgColor
        
        $0.setTitle("Apple로 로그인", for: .normal)
        $0.titleLabel?.font = UIFont(name: "RobotoCondensed-Regular", size: 17)
        $0.setTitleColor( UIColor(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        
        $0.setImage(UIImage(named: "apple"), for: .normal)
        $0.contentVerticalAlignment = .center
        $0.contentHorizontalAlignment = .center
    }
    
    let naverLoginButton = UIButton().then {
        $0.layer.cornerRadius = 15
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 0.658, green: 0.658, blue: 0.658, alpha: 0.7).cgColor
        
        $0.setTitle("네이버로 로그인", for: .normal)
        $0.titleLabel?.font = UIFont(name: "RobotoCondensed-Regular", size: 17)
        $0.setTitleColor( UIColor(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        
        $0.setImage(UIImage(named: "naver"), for: .normal)
        $0.contentVerticalAlignment = .center
        $0.contentHorizontalAlignment = .center
    }
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  self.view.addSubview(loginView)
        self.view.addSubview(kakaoLoginButton)
        self.view.addSubview(appleLoginButton)
        self.view.addSubview(naverLoginButton)
        
        setUI()
        configure()
        setNavigationBar()
            
    }
    
    func setUI() {
        kakaoLoginButton.snp.makeConstraints{ make in
            make.top.equalTo(loginView.logoLabel.snp.bottom).offset(342)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(44)
        }
        appleLoginButton.snp.makeConstraints { make in
            make.top.equalTo(kakaoLoginButton.snp.bottom).offset(9)
            make.left.width.height.equalTo(kakaoLoginButton)
        }
        
        naverLoginButton.snp.makeConstraints { make in
            make.top.equalTo(appleLoginButton.snp.bottom).offset(9)
            make.left.width.height.equalTo(kakaoLoginButton)
        }
    }
        /// Delegate, Register, AddTarget 등
    func configure() {
        kakaoLoginButton.addTarget(self, action: #selector(kakaoLogin(_:)), for: .touchUpInside)
        naverLoginButton.addTarget(self, action: #selector(naverLogin(_:)), for: .touchUpInside)
    }
        
        /// 네비게이션 바 설정
        /// - 타이틀, 아이템 등 네비게이션과 관련된 설정을 합니다.
    func setNavigationBar() {}
    
                                
    @objc func kakaoLogin(_ sender: UIButton!) {
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    
                    guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "afterLoginVC") else {return}
                    vc.modalPresentationStyle = .fullScreen //전체화면으로 보이게 설정
                    // vcName?.modalTransitionStyle = .crossDissolve //전환 애니메이션 설정
                    self.present(vc, animated: true)

                    //do something
                    _ = oauthToken
                }
            }
        }
        else { UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
            if let error = error {
                print(error)
            }
            else {
                print("loginWithKakaoAccount() success.")
                
                guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "afterLoginVC") else {return}
                vc.modalPresentationStyle = .fullScreen //전체화면으로 보이게 설정
                // vcName?.modalTransitionStyle = .crossDissolve //전환 애니메이션 설정
                self.present(vc, animated: true)
                //do something
                _ = oauthToken
            }
        }
        }
    }
    
    @objc func naverLogin(_ sender: UIButton) {
        naverLoginInstance?.delegate = self
        naverLoginInstance?.requestThirdPartyLogin()
      }
    

    
    func naverLoginPaser() {
        guard let accessToken = naverLoginInstance?.isValidAccessTokenExpireTimeNow() else { return }
              
        if !accessToken {
            return
        }
              
        guard let tokenType = naverLoginInstance?.tokenType else { return }
        guard let accessToken = naverLoginInstance?.accessToken else { return }
                
        let requestUrl = "https://openapi.naver.com/v1/nid/me"
        let url = URL(string: requestUrl)!
              
        let authorization = "\(tokenType) \(accessToken)"
              
        let req = AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization": authorization])
              
        req.responseJSON { response in
                
            guard let body = response.value as? [String: Any] else { return }
                  
            if let resultCode = body["message"] as? String{
                if resultCode.trimmingCharacters(in: .whitespaces) == "success"{
                    let resultJson = body["response"] as! [String: Any]
                    
                    let name = resultJson["name"] as? String ?? ""
                    let id = resultJson["id"] as? String ?? ""
                    let phone = resultJson["mobile"] as! String
                    let gender = resultJson["gender"] as? String ?? ""
                    let birthyear = resultJson["birthyear"] as? String ?? ""
                    let birthday = resultJson["birthday"] as? String ?? ""
                    let profile = resultJson["profile_image"] as? String ?? ""
                    let email = resultJson["email"] as? String ?? ""
                    let nickName = resultJson["nickname"] as? String ?? ""

                    print("네이버 로그인 이름 ",name)
                    print("네이버 로그인 아이디 ",id)
                    print("네이버 로그인 핸드폰 ",phone)
                    print("네이버 로그인 성별 ",gender)
                    print("네이버 로그인 생년 ",birthyear)
                    print("네이버 로그인 생일 ",birthday)
                    print("네이버 로그인 프로필사진 ",profile)
                    print("네이버 로그인 이메일 ",email)
                    print("네이버 로그인 닉네임 ",nickName)
                }
                    else{
                        //실패
                      }
                  }
              }
        }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension LoginVC : NaverThirdPartyLoginConnectionDelegate{
    func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
        print("네이버 로그인 성공")
        self.naverLoginPaser()
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "afterLoginVC") else {return}
        vc.modalPresentationStyle = .fullScreen //전체화면으로 보이게 설정
        // vcName?.modalTransitionStyle = .crossDissolve //전환 애니메이션 설정
        self.present(vc, animated: true)

    }
    
    func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
        print("네이버 토큰\(naverLoginInstance?.accessToken)")
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "afterLoginVC") else {return}
        vc.modalPresentationStyle = .fullScreen //전체화면으로 보이게 설정
        // vcName?.modalTransitionStyle = .crossDissolve //전환 애니메이션 설정
        self.present(vc, animated: true)
    }
    
    func oauth20ConnectionDidFinishDeleteToken() {
        print("네이버 로그아웃")
    }
    
    func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
        print("에러 = \(error.localizedDescription)")
    }
}
