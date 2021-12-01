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

extension ViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        viewModel.efetuarLogin(user: user)
    }
}






