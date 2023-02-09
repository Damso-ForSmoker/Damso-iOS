//
//  AppDelegate.swift
//  Damso
//
//  Created by 문정호 on 2023/01/09.
//

import UIKit
import NMapsMap
import KakaoSDKCommon
import NaverThirdPartyLogin

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        NMFAuthManager.shared().clientId = Keys.naverClientID
        KakaoSDK.initSDK(appKey: "10b5acb7e08f675d7eb1ca51cd7e4df8")
        
        application.registerForRemoteNotifications()
        let instance = NaverThirdPartyLoginConnection.getSharedInstance()
        instance?.isNaverAppOauthEnable = true //네이버앱 로그인 설정
        instance?.isInAppOauthEnable = true //사파리 로그인 설정

        instance?.serviceUrlScheme = "youbeen" //URL Scheme
        instance?.consumerKey = "hMZvNe3ACPoJdrLoSt6I" //클라이언트 아이디
        instance?.consumerSecret = "aqK98e8zWw" //시크릿 아이디
        instance?.appName = "loginPage" //앱이름
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
            NaverThirdPartyLoginConnection.getSharedInstance()?.application(app, open: url, options: options)
            return true
    }



}

