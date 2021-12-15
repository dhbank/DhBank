//
//  LoginViewModel.swift
//  DhBank
//
//  Created by Diego Honorio on 01/12/21.
//

import Foundation
import GoogleSignIn

protocol LoginViewModelDelegate {
    func loginEfetuado()
    func verificarUser()
}

class LoginViewModel{
    
    let service: FirebaseService = .init()
    var delegate: LoginViewModelDelegate?
    
    func efetuarLogin(user: GIDGoogleUser) {
        service.efetuarLoginService(user: user) { conseguiuEfetuarLogin in
            if conseguiuEfetuarLogin {
                self.delegate?.loginEfetuado()
            }
        }
    }
    
    func verificarUserLogado(){
        service.saberSeUsuarioEstaLogadoNoFirebase { verificar in
            if(verificar == true){
                print("EU SOU \(verificar)")
                self.delegate?.verificarUser()
            }else{
                return 
            }
                
        }
    }
    
}
