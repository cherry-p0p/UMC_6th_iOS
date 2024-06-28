//
//  ContentView.swift
//  week10_mission_kakao
//
//  Created by 채리원 on 6/19/24.
//

import SwiftUI
import KakaoSDKAuth
import KakaoSDKUser

struct ContentView: View {
    @State private var userName: String = ""
    @State private var userMail: String = ""
    @State private var profileImage: URL?
    @State private var loginStatus: String = ""

    var body: some View {
        ZStack {
            Color(hex: "#F7E600")
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                Text("카카오 로그인")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(hex: "#392020"))
                    .padding(.bottom, 30)
                
                Button(action: kakaoLogin) {
                    HStack {
                        Image("kakao_login_large_wide")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 50)
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.9)
                    .background(Color(hex: "#FEE500"))
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(hex: "#392020"), lineWidth: 2)
                    )
                }
                
                if !loginStatus.isEmpty {
                    Text(loginStatus)
                        .font(.headline)
                        .foregroundColor(.green)
                }
                
                Button(action: kakaoLogout) {
                    Text("로그아웃")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width * 0.9)
                        .background(Color.red)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(hex: "#392020"), lineWidth: 2)
                        )
                }
                
                if !userName.isEmpty {
                    Text("Name: \(userName)")
                        .font(.headline)
                        .foregroundColor(.black)
                }
                
                if !userMail.isEmpty {
                    Text("Email: \(userMail)")
                        .font(.headline)
                        .foregroundColor(.gray)
                }
                
                if let profileImage = profileImage {
                    AsyncImage(url: profileImage) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                    } placeholder: {
                        ProgressView()
                    }
                }
            }
            .padding()
            .background(Color.white.opacity(0.8))
            .cornerRadius(16)
            .shadow(radius: 10)
        }
    }
    
    func kakaoLogin() {
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk { (oauthToken, error) in
                if let error = error {
                    print(error)
                } else if let oauthToken = oauthToken {
                    print(oauthToken)
                    loginStatus = "로그인 성공"
                    fetchUserInfo()
                }
            }
        } else {
            UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
                if let error = error {
                    print(error)
                } else if let oauthToken = oauthToken {
                    print(oauthToken)
                    loginStatus = "로그인 성공"
                    fetchUserInfo()
                }
            }
        }
    }
    
    func fetchUserInfo() {
        UserApi.shared.me { (user, error) in
            if let error = error {
                print(error)
            } else {
                if let profile = user?.kakaoAccount?.profile {
                    userName = profile.nickname ?? ""
                    profileImage = profile.profileImageUrl
                }
                userMail = user?.kakaoAccount?.email ?? ""
            }
        }
    }
    
    func kakaoLogout() {
        UserApi.shared.logout { (error) in
            if let error = error {
                print(error)
            } else {
                print("로그아웃 성공")
                loginStatus = "로그아웃 성공"
                userName = ""
                userMail = ""
                profileImage = nil
            }
        }
    }
}

#Preview {
    ContentView()
}
