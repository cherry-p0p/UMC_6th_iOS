import UIKit
import KakaoSDKAuth
import KakaoSDKUser
import KakaoSDKCommon

class ViewController: UIViewController {
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("로그인", for: .normal)
        return button
    }()
    
    let logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("로그아웃", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupViews()
    }
    
    private func setupViews() {        view.addSubview(loginButton)
        view.addSubview(logoutButton)
        
        NSLayoutConstraint.activate([

            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
                    
            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoutButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20)
        ])
        
        loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        logoutButton.addTarget(self, action: #selector(logoutAction), for: .touchUpInside)
    }
    
    
    @objc private func loginAction() {
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
            if let error = error {
                print(error)
            }
            else {
                print("loginWithKakaoAccount() success.")
                
                _ = oauthToken
            }
        }
    }
    
    @objc private func logoutAction() {
        UserApi.shared.logout {(error) in
            if let error = error {
                print(error)
            }
            else {
                print("logout() success.")
            }
        }
    }
}

