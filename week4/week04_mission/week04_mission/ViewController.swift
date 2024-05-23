import UIKit

class ViewController: UIViewController {
    
    private var userDB = [String: String]()
    
    private lazy var idTextField: UITextField = createTextField(placeholder: "아이디")
    private lazy var pwTextField: UITextField = createTextField(placeholder: "비밀번호", isSecure: true)
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = UIColor.systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(Login), for: .touchUpInside)
        return button
    }()
    
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("회원가입", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = UIColor.systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(SignUp), for: .touchUpInside)
        return button
    }()
    
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [idTextField, pwTextField, loginButton, signUpButton, infoLabel])
        stackView.axis = .vertical
        stackView.spacing = 17
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
    
    
    private func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
        ])
    }
    
    
    private func createTextField(placeholder: String, isSecure: Bool = false) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.isSecureTextEntry = isSecure
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        return textField
    }
    
    
    @objc func Login() {
        let id = idTextField.text ?? ""
        let password = pwTextField.text ?? ""
        if let savedPassword = userDB[id], savedPassword == password {
            infoLabel.text = "로그인 성공"
            infoLabel.textColor = .black
        } else {
            infoLabel.text = "로그인 실패"
            infoLabel.textColor = .red
        }
    }
    
    
    @objc func SignUp() {
        let id = idTextField.text ?? ""
        let password = pwTextField.text ?? ""
        if userDB[id] != nil {
            infoLabel.text = "회원가입 실패 (이미 존재하는 아이디)"
            infoLabel.textColor = .red
        } else {
            userDB[id] = password
            infoLabel.text = "회원가입 성공"
            infoLabel.textColor = .black
        }
    }
}
