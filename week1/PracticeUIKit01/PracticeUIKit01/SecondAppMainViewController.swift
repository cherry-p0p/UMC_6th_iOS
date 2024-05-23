//
//  SecondAppMainViewController.swift
//  PracticeUIKit01
//
//  Created by cherrypop on 4/10/24.
//

import UIKit

class SecondAppMainViewController: UIViewController {
    
    let diceimageNameData = ["one", "two", "three", "four" , "five", "six"]
    
    lazy var diceImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "one"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var changeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("변경해주세요", for: .normal)
        button.backgroundColor = .purple
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(diceImageView)
        
        diceImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        diceImageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        diceImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        diceImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(changeButton)
        changeButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        changeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        changeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        changeButton.topAnchor.constraint(equalTo: diceImageView.bottomAnchor, constant: 100).isActive = true
        changeButton.addTarget(self, action: #selector(didTapChangeDiceImageButton) , for: .touchUpInside)
    }
    
    @objc func didTapChangeDiceImageButton() {
        diceImageView.image = UIImage(named: diceimageNameData.randomElement() ?? "one")
    }
}
