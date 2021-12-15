//
//  FirebaseService.swift
//  DhBank
//
//  Created by Diego Honorio on 01/12/21.
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
            print(">>>>> Usuário fez logout")
            return true
        } catch {
            print(">>>>> Erro ao fazer logout")
            return false
        }
    }
    
    func saberSeUsuarioEstaLogadoNoFirebase(completion: @escaping (Bool) -> Void) {
            let firebaseAuth = Auth.auth()
            let usuarioAtual = firebaseAuth.currentUser
    
            if usuarioAtual != nil {
                print(">>> Estou logado")
                completion(true)
            } else {
                print(">>> Estou NAo logado")
                completion(false)
            }
        }
    
}
