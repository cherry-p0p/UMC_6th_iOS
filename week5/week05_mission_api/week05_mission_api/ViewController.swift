import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var centerName: UILabel!
    var address: UILabel!
    var facilityName: UILabel!
    var phoneNumber: UILabel!
    
    var mainView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        // Initialize labels with default text and styling
        centerName = createLabel(title: "Center Name")
        address = createLabel(title: "Address")
        facilityName = createLabel(title: "Facility Name")
        phoneNumber = createLabel(title: "Phone Number")
        
        // Initialize the stack view
        mainView = UIStackView(arrangedSubviews: [centerName, address, facilityName, phoneNumber])
        mainView.axis = .vertical
        mainView.distribution = .fillEqually
        mainView.spacing = 10
        mainView.alignment = .fill
        
        view.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        
     
        NSLayoutConstraint.activate([
            mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        

        let fetchButton = UIButton(type: .system)
        fetchButton.setTitle("Fetch Data", for: .normal)
        fetchButton.addTarget(self, action: #selector(fetchData), for: .touchUpInside)
        
        view.addSubview(fetchButton)
        fetchButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            fetchButton.topAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 20),
            fetchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func createLabel(title: String) -> UILabel {
        let label = UILabel()
        label.text = title
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0     
        return label
    }
    
    @objc func fetchData() {
        RequestFile().getRequestData(self)
    }
    
    func didSuccess(_ response: ResponseFile) {
        DispatchQueue.main.async {
            guard let data = response.data, !data.isEmpty else {
                print("No data available or data is empty")
                return
            }
            let randomIndex = Int.random(in: 0..<data.count) 
            
            self.centerName.text = data[randomIndex].centerName ?? "No data"
            self.address.text = data[randomIndex].address ?? "No data"
            self.facilityName.text = data[randomIndex].facilityName ?? "No data"
            self.phoneNumber.text = data[randomIndex].phoneNumber ?? "No data"
        }
    }
}


