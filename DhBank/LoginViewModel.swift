//
//  LoginViewModel.swift
//  DhBank
//
//  Created by DiegoH on 30/12/21.
//

import Foundation
import GoogleSignIn
import UIKit
import Alamofire
import GoogleSignIn
import FirebaseAuth
import FacebookCore
import FacebookLogin
import Firebase

protocol LoginViewModelDelegate{
 func loginEfetuado()
}

public class LoginViewModel{

    let service: FirebaseService = .init()
    var delegate: LoginViewModelDelegate?
    
    func efetuarLogin(user: GIDGoogleUser) {
        
        service.efetuarLoginService(user: user) { conseguiuEfetuarLogin in
            
            if(conseguiuEfetuarLogin == true){
                self.delegate?.loginEfetuado()
            }else{
                print(">>> False")
            }
            
        }
    }

    
    func getUserProfile(token: AccessToken?, userId: String?) {
            let graphRequest: GraphRequest = GraphRequest(graphPath: "me", parameters: ["fields": "id, first_name, middle_name, last_name, name, picture, email"])
            graphRequest.start { _, result, error in
                if error == nil {
                    let data: [String: AnyObject] = result as! [String: AnyObject]
                    
                    print("Facebook Access Token: \(token?.tokenString ?? "")")
                } else {
                    print("Error: Trying to get user's info")
                }
            }
        }
    
    func loginFacebookResult(aceesToken:String, completion: @escaping (Bool) -> Void){
        let credential = FacebookAuthProvider.credential(withAccessToken: aceesToken)
        Auth.auth().signIn(with: credential) { result, error in
            if let error = error{
                print(">>> \(error)")
            }
                    
            if Auth.auth().currentUser != nil{
            completion(true)
            }
        }
    }
    
    
}
