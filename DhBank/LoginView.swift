//
//  LoginView.swift
//  DhBank
//
//  Created by DiegoH on 29/12/21.
//

import UIKit
import GoogleSignIn
import FacebookCore
import FacebookLogin

protocol LoginViewDelegate: AnyObject {
    func goto()
    func teste()
    func loginFacebook()
}

class LoginView: UIView, CodeView {
 
    
    weak var delegate: LoginViewDelegate?

        
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0.00, green: 0.68, blue: 0.90, alpha: 1.00)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let logo: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "dhBankLogo.png")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    private let textDHBank: UILabel = {
        let value = UILabel(frame: .zero)
        value.translatesAutoresizingMaskIntoConstraints = false
        value.text = "DHBank"
        value.font = .systemFont(ofSize: 30, weight: .bold)
        value.textColor = .white
        return value
    }()
    
    private let button: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.setImage(UIImage(named: "googleIcon.png"), for: UIControl.State.normal)
        return button
    }()
    
    private let buttonFacebook: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.addTarget(self, action: #selector(buttonTapped2), for: .touchUpInside)
        button.setImage(UIImage(named: "facebookIcon.png"), for: UIControl.State.normal)
        return button
    }()
    
    func loginEfetuado() {
        print("teste")
    }
    
    func verificarUser() {
       
    }
    
    
    @objc func buttonTapped(){
        delegate?.teste()
    }
    
    @objc func buttonTapped2(){
        delegate?.loginFacebook()
    }
    
    
    
    func buildViewHierarchy() {
        self.addSubview(logo)
        self.addSubview(textDHBank)
        self.addSubview(button)
        self.addSubview(buttonFacebook)
    }
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
        self.logo.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100),
        self.logo.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        
        self.textDHBank.topAnchor.constraint(equalTo: self.logo.bottomAnchor),
        self.textDHBank.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
        self.button.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 100),
        self.button.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
        
        self.buttonFacebook.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -100),
        self.buttonFacebook.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
        
        
        ])
    }
    
    func extraSetupConfiguration() {
        
    }
    
    
}

