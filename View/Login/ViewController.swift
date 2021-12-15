//
//  ViewController.swift
//  DhBank
//
//  Created by Eduardo Escaleira on 20/10/21.
//

import UIKit
import Alamofire
import GoogleSignIn
import FirebaseAuth
import FacebookCore
import FacebookLogin
import Firebase

class ViewController: UIViewController {
    
    let viewModel: LoginViewModel = .init()
    private let service: CoreDataService = .init()
    
   
    
    
    @IBOutlet weak var logoIntroAplication: UIView!
    @IBOutlet weak var toopView: UIView!
    @IBOutlet weak var bottonView: UIView!
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let check = service.verificarBool()
        checkPoint = check
        
        GIDSignIn.sharedInstance().presentingViewController = self
        GIDSignIn.sharedInstance().delegate = self
        viewModel.delegate = self
        
        starAnimation()
        
        viewModel.verificarUserLogado()
        
        
        let loginButton = FBLoginButton(frame: .zero, permissions: [.publicProfile])
        loginButton.center = view.center
        
        self.view.addSubview(loginButton)
        
        loginButton.delegate = self
        
        
        if let accessToken = AccessToken.current{
            print(">>> LOGADO")
            print(">>> AcessToken \(accessToken)")
        }
    }
    
    func loginFacebook(aceesToken:String){
        let credential = FacebookAuthProvider.credential(withAccessToken: aceesToken)
        Auth.auth().signIn(with: credential) { result, error in
            if let error = error{
                print("erro no facebook")
            }
            
            print(result)
            print("eae foi")
            
            if let user = Auth.auth().currentUser{
                print(user.email)
            }
        }
    }
    
    var checkPoint: Bool = false
    
    func starAnimation(){
          toopView.translatesAutoresizingMaskIntoConstraints = true
          bottonView.translatesAutoresizingMaskIntoConstraints = true
          UIView.animate(withDuration: 0.7) {
              self.toopView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.center.y + 15)
          }
          
        UIView.animate(withDuration: 0.5) {
            self.bottonView.frame = CGRect(x: -150, y: self.view.center.y + 70, width: self.view.frame.size.width + 150, height: self.view.frame.size.height)
        }
        
        UIView.animate(withDuration: 2.5) {
            self.logoIntroAplication.alpha = 0
            self.logoIntroAplication.alpha = 1
        }
    }
    
  
    
}

extension ViewController: LoginViewModelDelegate {
   
    func verificarUser() {
        if(self.checkPoint){
            self.performSegue(withIdentifier: "homeSegueIdentifier", sender: nil)
        }else{
            self.performSegue(withIdentifier: "bemVindoSegue", sender: nil)
        }
    }
    
    func loginEfetuado() {
        if(self.checkPoint){
            self.performSegue(withIdentifier: "homeSegueIdentifier", sender: nil)
        }else{
            self.performSegue(withIdentifier: "bemVindoSegue", sender: nil)
        }
    }
    
}

extension ViewController: LoginButtonDelegate{
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        print(">>> Efetuou login")
        
        switch result{
            
        case .none:
            print("Erro ao conectar com facebook")
        case .some(let loginResult):
            print(">>> \(loginResult.grantedPermissions)")
            print(">>> \(loginResult.declinedPermissions)")
            print(">>> \(loginResult.isCancelled)")
            print(">>> \(loginResult.token)")
            
            if let token = loginResult.token?.tokenString{
                loginFacebook(aceesToken: token)
            }
        }
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print(">>> Efetuou logout")
    }
    
    
}

extension ViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        viewModel.efetuarLogin(user: user)
    }
}






