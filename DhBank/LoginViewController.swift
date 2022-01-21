//
//  LoginViewController.swift
//  DhBank
//
//  Created by DiegoH on 29/12/21.
//

import UIKit
import Alamofire
import GoogleSignIn
import FirebaseAuth
import FacebookCore
import FacebookLogin
import Firebase

class LoginViewController: UIViewController {
    

    private let loginView: LoginView
    private let service: CoreDataService = .init()
    
    var checkPoint: Bool = false
    
    private var googleteste = GIDSignIn.sharedInstance()
    
    let viewModel: LoginViewModel = .init()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().presentingViewController = self
        GIDSignIn.sharedInstance().delegate = self
        viewModel.delegate = self
        
        let check = service.verificarBool()
        checkPoint = check
        
    }

    override func loadView() {
        view = loginView
    }
    
    init(){
        self.loginView = LoginView()
        super.init(nibName: nil, bundle: nil)
        self.loginView.delegate = self
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension LoginViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
             viewModel.efetuarLogin(user: user)
    }
}


extension LoginViewController: LoginViewModelDelegate {
    
    func loginEfetuado() {
        goto()
    }
    
}

extension LoginViewController: LoginViewDelegate {

    func loginFacebook(){
        let loginManager = LoginManager()
               loginManager.logIn(permissions: ["public_profile", "email"], from: self, handler: { result, error in
                   if error != nil {
                       print(">>> error get itens Facebook")
                   } else if result?.isCancelled != nil {
                       if result?.token?.tokenString != nil {
                           if let token = result?.token?.tokenString{
                               self.viewModel.loginFacebookResult(aceesToken: token, completion: {returnTrue in
                                   if(returnTrue == true){
                                       print(">>> Login efetuado no Facebook")
                                       self.goto()
                                   }else{
                                       return
                                   }
                               })
                           }
                           self.viewModel.getUserProfile(token: result?.token, userId: result?.token?.userID)
                       } else {
                           print(">>> Facebook Canceled")
                       }
                   }
               })
    }
  
    func goto() {
        
        let vc = checkPoint ? HomeViewController() : WelcomeFeedBackViewController()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true)
    }
    
    func teste() {
      self.googleteste?.signIn()
    }
    
}



