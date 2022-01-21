//
//  CodeView.swift
//  DhBank
//
//  Created by DiegoH on 29/12/21.
//

import Foundation


protocol CodeView{
    func buildViewHierarchy()
    func setupConstraints()
    func extraSetupConfiguration()
    func setUp()
}

extension CodeView{
    
    func setUp(){
        buildViewHierarchy()
        setupConstraints()
        extraSetupConfiguration()
    }
    
}



