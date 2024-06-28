//
//  week10_mission_kakaoApp.swift
//  week10_mission_kakao
//
//  Created by 채리원 on 6/19/24.
//


import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct week10_mission_kakaoApp: App {
    
    init() {
        KakaoSDK.initSDK(appKey: "50bfad13ab3050367770c4bef5489ffa")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { url in
                    if AuthApi.isKakaoTalkLoginUrl(url) {
                        _ = AuthController.handleOpenUrl(url: url)
                    }
                }
        }
    }
}
