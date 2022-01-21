//
//  HomeView.swift
//  DhBank
//
//  Created by DiegoH on 29/12/21.
//

import UIKit
import SwiftUI
import FirebaseAuth

protocol HomeViewDelegate: AnyObject {
    func logoutEfetuado()
    func showAlert(alert: UIAlertController)
    func shared()
    func gotoDetails()
}

class HomeView: UIView, CodeView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    weak var delegate: HomeViewDelegate?
    
    var valueUSDBID: String = ""
    var valorUSD: String = ""
    var valorEUR: String = ""
    var valueEURBID: String = ""
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
        let listTitleCurrent = ["USD", "EUR"]
        let listValueCurrent = [valueUSDBID, valueEURBID ]
        
        cell.labelCurrent.text = listTitleCurrent[indexPath.item]
        cell.valueCurrent.text = listValueCurrent[indexPath.item]

        return cell
    }
    
    
    private let CollectionViewCustom: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 150, height: 150)
        let value = UICollectionView(frame: .zero, collectionViewLayout: layout)
        value.translatesAutoresizingMaskIntoConstraints = false
        value.backgroundColor = .none
        value.clipsToBounds = true
        return value
    }()
    
    
    private let view3: UIView = {
        let value = UIView(frame: .zero)
        value.translatesAutoresizingMaskIntoConstraints = false
        value.layer.cornerRadius = 8
        value.backgroundColor = .none
        return value
    }()
    
    
    private let view: UIView = {
        let value = UIView(frame: .zero)
        value.translatesAutoresizingMaskIntoConstraints = false
        value.backgroundColor = UIColor(red: 0.00, green: 0.68, blue: 0.90, alpha: 1.00)
        return value
    }()
    
    
    private let viewProfile: UIView = {
        let value = UIView(frame: .zero)
        value.translatesAutoresizingMaskIntoConstraints = false
        value.backgroundColor = UIColor(red: 0.00, green: 0.68, blue: 0.90, alpha: 1.00)
        return value
    }()
    
    
    private let labelWelcome: UILabel = {
        let value = UILabel(frame: .zero)
        value.translatesAutoresizingMaskIntoConstraints = false
        value.text = "Bem-vindo"
        value.font = .systemFont(ofSize: 20, weight: .bold)
        value.textColor = .white
        return value
    }()
    
    
    private let nameUser: UILabel = {
        let value = UILabel(frame: .zero)
        value.translatesAutoresizingMaskIntoConstraints = false
        value.text = "Name_User"
        value.textColor = .white
        value.font = .systemFont(ofSize: 16, weight: .medium)
        return value
    }()
    
    
    private let imageViewTutorial: UIImageView = {
        let data = try? Data(contentsOf: UserDefaults.standard.url(forKey: "urlImageUser")!)
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(data: data!)
        image.layer.cornerRadius = 45
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    
    private let view2: UIView = {
        let value = UIView(frame: .zero)
        value.translatesAutoresizingMaskIntoConstraints = false
        value.backgroundColor = .red
        value.layer.cornerRadius = 8
        return value
    }()
    
    
    
    private let button: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Consultar outras moedas", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.addTarget(self, action: #selector(buttonTapped2), for: .touchUpInside)
        button.layer.cornerRadius = 8
        button.backgroundColor = .systemPink
        return button
    }()
    
    
    @objc func buttonTapped2(){
        delegate?.gotoDetails()
    }
    
    
    private let buttonLogout: UIButton = {
        let buttonLogout = UIButton(frame: .zero)
        buttonLogout.translatesAutoresizingMaskIntoConstraints = false
        buttonLogout.setImage(UIImage(systemName: "arrow.right.to.line.circle"), for: .normal)
        buttonLogout.tintColor = .white
        buttonLogout.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return buttonLogout
    }()
    
    
    func funcLogout(){
        delegate?.logoutEfetuado()
    }
    
    
    private let buttonShared: UIButton = {
        let buttonLogout = UIButton(frame: .zero)
        buttonLogout.translatesAutoresizingMaskIntoConstraints = false
        buttonLogout.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        buttonLogout.tintColor = .white
        buttonLogout.addTarget(self, action: #selector(funcShared), for: .touchUpInside)
        return buttonLogout
    }()
    
    
    @objc func funcShared(){
        delegate?.shared()
    }
    
    
    
    @objc func buttonTapped(){
        let alert = UIAlertController(title: "Atenção ", message: "Você tem certeza que deseja sair?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Sim", style: UIAlertAction.Style.default, handler: {_ in self.funcLogout()}))
        alert.addAction(UIAlertAction(title: "Não", style: UIAlertAction.Style.default, handler: nil))
        delegate?.showAlert(alert: alert)
    }
    
    
    private let BRL: UILabel = {
        let value = UILabel(frame: .zero)
        value.translatesAutoresizingMaskIntoConstraints = false
        value.text = "Bandeira BRL"
        return value
    }()
    
    
    private let textInput: UITextField = {
        let value = UITextField(frame: .zero)
        value.translatesAutoresizingMaskIntoConstraints = false
        value.textColor = .black
        value.attributedPlaceholder = NSAttributedString(string: "R$ 1,00", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        return value
    }()
    
    
    func getitem(){
        let services: apiServices = .init()
        
        services.getAllDataUSD { CoinModel in
            self.valueUSDBID = CoinModel!.usdbrl.bid
            self.valorUSD = CoinModel!.usdbrl.bid
            self.CollectionViewCustom.reloadData()
        }
        
        services.getAllDataEUR { CoinModelEUR in
            self.valueEURBID = CoinModelEUR!.eurbrl.bid
            self.valorEUR = CoinModelEUR!.eurbrl.bid
            self.CollectionViewCustom.reloadData()
        }
        
    }
    
    
    func coreApp(valor: Double, valorParametro: Double) -> String{
        let result = String(valor*valorParametro)
        return result
    }
    
    
    @objc func doneButtonAction(){
        let valorText = textInput.text ?? ""
        let myDouble = Double(valorText) ?? 0
        let valor = Double(valorUSD) ?? 0
        
        
        let transformeString = String(myDouble*valor)
        valueUSDBID = transformeString
        
     
        let myDoubleEur = Double(valorText) ?? 0
        let valorEur = Double(valorEUR) ?? 0
        let transformeStringEur = String(myDoubleEur*valorEur)
        valueEURBID = transformeStringEur
        
        
        self.CollectionViewCustom.reloadData()
    }
    
    
    func addDoneButtonOnKeyboard(){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle = UIBarStyle.default
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Converter", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.doneButtonAction))

        let items = NSMutableArray()
        items.add(flexSpace)
        items.add(done)

        doneToolbar.items = items as? [UIBarButtonItem]
        doneToolbar.sizeToFit()
        self.textInput.inputAccessoryView = doneToolbar
        self.textInput.inputAccessoryView = doneToolbar

    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor =  UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.00)
        setUp()
        getitem()
        getDataUser()
        
        self.addDoneButtonOnKeyboard()
        
        CollectionViewCustom.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        CollectionViewCustom.dataSource = self
        CollectionViewCustom.delegate  = self
        CollectionViewCustom.frame = view.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func getDataUser(){
        let firebaseAuth = Auth.auth()
        let currentUser = firebaseAuth.currentUser
        guard currentUser != nil else {return}
        
        UserDefaults.standard.set(currentUser?.photoURL, forKey: "urlImageUser")
        
        UserDefaults.standard.set(currentUser?.displayName, forKey: "nameUser")
        
        let nameUser = UserDefaults.standard.object(forKey: "nameUser")
        self.nameUser.text = nameUser as? String
    }
    
    
    private let viewData: UIView = {
        let value = UIView(frame: .zero)
        value.translatesAutoresizingMaskIntoConstraints = false
        value.backgroundColor = .white
        value.layer.cornerRadius = 8
        return value
    }()
    
    
    private let viewDivider: UIView = {
        let value = UIView(frame: .zero)
        value.translatesAutoresizingMaskIntoConstraints = false
        value.backgroundColor = .white
        value.alpha = 0.6
        return value
    }()
    
    
    func buildViewHierarchy() {
        
        self.addSubview(view)
        self.addSubview(viewProfile)
        self.viewProfile.addSubview(viewDivider)
        self.view.addSubview(viewData)
        
        
        self.viewProfile.addSubview(imageViewTutorial)
        self.viewProfile.addSubview(labelWelcome)
        self.viewProfile.addSubview(nameUser)
        self.viewProfile.addSubview(buttonShared)
        self.viewProfile.addSubview(buttonLogout)
        
        
        
        self.viewData.addSubview(textInput)
        self.viewData.addSubview(button)
        
        
        self.view.addSubview(view3)
        self.view3.addSubview(CollectionViewCustom)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            
            self.viewProfile.topAnchor.constraint(equalTo: topAnchor),
            self.viewProfile.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.viewProfile.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.viewProfile.heightAnchor.constraint(equalToConstant: 100),
            
            self.imageViewTutorial.topAnchor.constraint(equalTo: self.viewProfile.topAnchor, constant: 60),
            self.imageViewTutorial.centerXAnchor.constraint(equalTo: self.viewProfile.centerXAnchor),
            self.imageViewTutorial.heightAnchor.constraint(equalToConstant: 90),
            self.imageViewTutorial.widthAnchor.constraint(equalToConstant: 90),
            
            self.labelWelcome.topAnchor.constraint(equalTo: self.viewProfile.topAnchor, constant: 40),
            self.labelWelcome.leadingAnchor.constraint(equalTo: self.viewProfile.leadingAnchor, constant: 16),
            self.labelWelcome.trailingAnchor.constraint(equalTo: self.viewProfile.trailingAnchor, constant: -16),
            
            self.nameUser.topAnchor.constraint(equalTo: self.viewProfile.topAnchor, constant: 67),
            self.nameUser.leadingAnchor.constraint(equalTo: self.viewProfile.leadingAnchor, constant: 40),
            self.nameUser.trailingAnchor.constraint(equalTo: self.viewProfile.trailingAnchor, constant: -40),
            
            
            self.buttonShared.topAnchor.constraint(equalTo: self.viewProfile.topAnchor, constant: 67),
            self.buttonShared.trailingAnchor.constraint(equalTo: self.viewProfile.trailingAnchor, constant: -80),
            
            self.buttonLogout.topAnchor.constraint(equalTo: self.viewProfile.topAnchor, constant: 67),
            self.buttonLogout.trailingAnchor.constraint(equalTo: self.viewProfile.trailingAnchor, constant: -16),
            
            self.viewDivider.trailingAnchor.constraint(equalTo: self.viewProfile.trailingAnchor),
            self.viewDivider.leadingAnchor.constraint(equalTo: self.viewProfile.leadingAnchor),
            self.viewDivider.heightAnchor.constraint(equalToConstant: 1),
            self.viewDivider.bottomAnchor.constraint(equalTo: self.viewProfile.bottomAnchor),
            
            self.view.topAnchor.constraint(equalTo: self.viewProfile.bottomAnchor),
            self.view.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.view.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.view.heightAnchor.constraint(equalToConstant: 120),
            
            self.viewData.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 80),
            self.viewData.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            self.viewData.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            self.viewData.heightAnchor.constraint(equalToConstant: 80),
            
            
            self.textInput.centerYAnchor.constraint(equalTo: self.viewData.centerYAnchor),
            self.textInput.leadingAnchor.constraint(equalTo: self.viewData.leadingAnchor, constant: 30),
            
            
            self.button.centerYAnchor.constraint(equalTo: self.viewData.centerYAnchor),
            self.button.leadingAnchor.constraint(equalTo: self.viewData.leadingAnchor, constant: 130),
            
            self.view3.topAnchor.constraint(equalTo: self.viewData.bottomAnchor),
            self.view3.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.view3.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.view3.heightAnchor.constraint(equalToConstant: 400),
            
            
            self.CollectionViewCustom.topAnchor.constraint(equalTo: self.view3.topAnchor, constant: 50),
            self.CollectionViewCustom.heightAnchor.constraint(equalToConstant: 150),
            self.CollectionViewCustom.leadingAnchor.constraint(equalTo: self.view3.leadingAnchor, constant: 20),
            self.CollectionViewCustom.trailingAnchor.constraint(equalTo: self.view3.trailingAnchor, constant: -20),
            
        ])
    }
    
    func extraSetupConfiguration() {
        
    }
    
    
}
