//
//  WelcomeFeedBackView.swift
//  DhBank
//
//  Created by Diego Honório on 12/01/22.
//

import UIKit
import SwiftUI
import FirebaseAuth


protocol WelcomeFeedBackViewDelegate: AnyObject {
    func goto()
}


class WelcomeFeedBackView: UIView, CodeView {

    public var unchecked = true
    private let service: CoreDataService = .init()
    
    weak var delegate: WelcomeFeedBackViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0.00, green: 0.68, blue: 0.90, alpha: 1.00)
        setUp()
        getDataUser()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getDataUser(){
        let firebaseAuth = Auth.auth()
        let currentUser = firebaseAuth.currentUser
        guard currentUser != nil else {return}
        let defaults = UserDefaults.standard
        
        defaults.set(currentUser?.photoURL, forKey: "urlImageUser")
        
        defaults.set(currentUser?.displayName, forKey: "nameUser")
        let nameUser = UserDefaults.standard.object(forKey: "nameUser")
        self.nameUser.text = nameUser as? String
    }
    
    
    private let welcomeLabel: UILabel = {
        let value = UILabel(frame: .zero)
        value.translatesAutoresizingMaskIntoConstraints = false
        value.textColor = .white
        value.font = UIFont.boldSystemFont(ofSize: 30.0)
        value.text = "Bem vindo(a)"
        return value
    }()
    
    private let nameUser: UILabel = {
        let value = UILabel(frame: .zero)
        value.translatesAutoresizingMaskIntoConstraints = false
        value.font = UIFont.boldSystemFont(ofSize: 25.0)
        value.textColor = .white
        return value
    }()
    
    private let view: UIView = {
        let value = UIView(frame: .zero)
        value.translatesAutoresizingMaskIntoConstraints = false
        return value
    }()
    
    private let viewTextLGPD: UIView = {
        let value = UIView(frame: .zero)
        value.translatesAutoresizingMaskIntoConstraints = false
        return value
    }()
    
    private let textLgpd: UILabel = {
        let value = UILabel(frame: .zero)
        value.translatesAutoresizingMaskIntoConstraints = false
        value.font = UIFont.boldSystemFont(ofSize: 20)
        value.text = "Lorem ipsum dolor sit amet consectetur adipiscing elit torquent habitasse quisque nascetur sed ultrices ad nam massa, dis pulvinar condimentum eros pretium mauris nec metus duis pellentesque vulputate volutpat sapien penatibus nisi. Netus ut nulla mattis consectetur dictumst natoque dictum, dapibus quam pharetra viverra nunc porttitor posuere aptent, accumsan nascetur felis euismod lobortis nibh."
        value.textColor = .white
        value.numberOfLines = 0
        value.lineBreakMode = .byCharWrapping
        return value
    }()
    
    private let jumperHome: UIButton = {
        let buttonLogout = UIButton(frame: .zero)
        buttonLogout.frame.size.height = 50
        buttonLogout.frame.size.width = 80
        buttonLogout.translatesAutoresizingMaskIntoConstraints = false
        buttonLogout.setTitle("Pular", for: .normal)
        buttonLogout.titleLabel?.font = .systemFont(ofSize: 16)
        buttonLogout.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        buttonLogout.layer.cornerRadius = 8
        buttonLogout.backgroundColor = .systemPink
        return buttonLogout
    }()
    
    @objc func buttonTapped(){
        if unchecked == true{
            delegate?.goto()
        }else{
            service.adicionarInfo(checkpoint: true)
            delegate?.goto()
        }
    }
    
    private let checkBox: UIButton = {
        let checkBoxButton = UIButton(type: .system)
        checkBoxButton.translatesAutoresizingMaskIntoConstraints = false
        checkBoxButton.clipsToBounds = true
        checkBoxButton.setImage(UIImage(systemName:"checkmark.circle"), for: .normal)
        checkBoxButton.tintColor = .white
        checkBoxButton.contentMode = .scaleAspectFill
        checkBoxButton.addTarget(self, action: #selector(boxTapped(_:)), for: .touchUpInside)
        return checkBoxButton
    }()
    @objc func boxTapped(_ sender: UIButton) {
        if unchecked {
            jumperHome.setTitle("Pular", for: .normal)
            checkBox.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            self.unchecked = false
          
        }
        else {
            jumperHome.setTitle("Salvar", for: .normal)
            checkBox.setImage(UIImage(systemName:"checkmark.circle"), for: .normal)
            self.unchecked = true
        }
    }
    
    private let titleCheckBox: UILabel = {
        let value = UILabel(frame: .zero)
        value.translatesAutoresizingMaskIntoConstraints = false
        value.text = "Caso nao queira ver novamente"
        value.textAlignment = .center
        value.textColor = .white
        return value
    }()
    
    func buildViewHierarchy() {
        self.addSubview(view)
        self.view.addSubview(welcomeLabel)
        self.view.addSubview(nameUser)
        self.addSubview(viewTextLGPD)
        self.viewTextLGPD.addSubview(textLgpd)
        self.viewTextLGPD.addSubview(jumperHome)
        self.viewTextLGPD.addSubview(checkBox)
        self.viewTextLGPD.addSubview(titleCheckBox)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            self.view.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.view.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.view.heightAnchor.constraint(equalToConstant: 200),
  
            
            self.welcomeLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.welcomeLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.welcomeLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            self.nameUser.topAnchor.constraint(equalTo: self.welcomeLabel.bottomAnchor, constant: 10),
            self.nameUser.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 60),
            self.nameUser.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -60),
            
            self.viewTextLGPD.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.viewTextLGPD.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            self.viewTextLGPD.heightAnchor.constraint(equalToConstant: 500),
            self.viewTextLGPD.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 150),
            
            self.textLgpd.leadingAnchor.constraint(equalTo: self.viewTextLGPD.leadingAnchor, constant: 0),
            self.textLgpd.trailingAnchor.constraint(equalTo: self.viewTextLGPD.trailingAnchor, constant: -0),
     
            self.jumperHome.topAnchor.constraint(equalTo: self.viewTextLGPD.topAnchor, constant: 300),
            self.jumperHome.leadingAnchor.constraint(equalTo: self.viewTextLGPD.leadingAnchor, constant: 0),
            self.jumperHome.trailingAnchor.constraint(equalTo: self.viewTextLGPD.trailingAnchor, constant: -0),
            
            self.checkBox.topAnchor.constraint(equalTo: self.viewTextLGPD.topAnchor, constant: 350),
            
            self.titleCheckBox.topAnchor.constraint(equalTo: self.viewTextLGPD.topAnchor, constant: 350),
            self.titleCheckBox.leadingAnchor.constraint(equalTo: self.checkBox.trailingAnchor, constant: 10),
            self.titleCheckBox.centerXAnchor.constraint(equalTo: self.viewTextLGPD.centerXAnchor)
            
        ])
    }
    
    func extraSetupConfiguration() {
        
    }
    
}
