//
//  HomeViewModel.swift
//  DhBank
//
//  Created by Diego Honório on 17/01/22.
//

import Foundation

protocol HomeViewModelDelegate {
    func logoutEfetuado()
}

class HomeViewModel{
    
    let service: FirebaseService = .init()
    var delegate: HomeViewModelDelegate?

    
    func coreApp(valor: Double, valorParametro: Double) -> String{
        
        let result = String(valor*valorParametro)
        return result
        
    }
    
    
    func efetuarLogout() {
        service.deslogarDoFirebase(){ logoutSucessfull in
            if(logoutSucessfull){
                self.delegate?.logoutEfetuado()
            }
        }
    }
    
    
   
    

}

