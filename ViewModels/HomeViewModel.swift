//
//  HomeViewModel.swift
//  DhBank
//
//  Created by Diego Honorio on 01/12/21.
//

import Foundation

protocol HomeViewModelDelegate {
    func logoutEfetuado()
}

class HomeViewModel{
    
    let service: FirebaseService = .init()
    var delegate: HomeViewModelDelegate?

    
    func efetuarLogout() {
        service.deslogarDoFirebase(){ logoutSucessfull in
            if(logoutSucessfull){
                self.delegate?.logoutEfetuado()
            }
        }
    }
    

}
