//
//  FirebaseService.swift
//  DhBank
//
//  Created by DiegoH on 30/12/21.
//



import Foundation
import Firebase
import GoogleSignIn

class FirebaseService {
    
    func efetuarLoginService(user: GIDGoogleUser, completion: @escaping (Bool) -> Void) {
        guard
            let authentication = user.authentication,
            let idToken = authentication.idToken else { return }
        
        let credential = GoogleAuthProvider.credential(
            withIDToken: idToken,
            accessToken: authentication.accessToken
        )
        
        Auth.auth().signIn(with: credential) { authResult, error in
            if error != nil { return }
            completion(true)
        }
    }
    
    
    func deslogarDoFirebase(completion: @escaping (Bool) -> Void) -> Bool {
        do {
            try Auth.auth().signOut()
            print(">>> Eu acabei de fazer o logout")
            return true
        } catch {
            print(">>> Erro ao fazer logout")
            return false
        }
    }
    
    func saberSeUsuarioEstaLogadoNoFirebase(completion: @escaping (Bool) -> Void) {
            let firebaseAuth = Auth.auth()
            let usuarioAtual = firebaseAuth.currentUser
    
            if usuarioAtual != nil {
                print(">>> Eu estou logado no firebase")
                completion(true)
            } else {
                print(">>> Eu não estou logado no firebase")
                completion(false)
            }
        }
    
}
