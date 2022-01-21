//
//  DetailsCoinView.swift
//  DhBank
//
//  Created by Diego Honório on 21/01/22.
//

import UIKit
import SwiftUI


class DetailsCoinView: UIView, CodeView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0.00, green: 0.68, blue: 0.90, alpha: 1.00)
        getitem()
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let maximoUSD: UILabel = {
        let value = UILabel(frame: .zero)
        value.translatesAutoresizingMaskIntoConstraints = false
        value.text = "TEXTO"
        value.textColor = .white
        return value
    }()
    private let minimoUSD: UILabel = {
        let value = UILabel(frame: .zero)
        value.translatesAutoresizingMaskIntoConstraints = false
        value.text = "TEXTO"
        value.textColor = .white
        return value
    }()
    private let dateUSD: UILabel = {
        let value = UILabel(frame: .zero)
        value.translatesAutoresizingMaskIntoConstraints = false
        value.text = "TEXTO"
        value.textColor = .white
        return value
    }()
    private let textLabelUSD: UILabel = {
        let value = UILabel(frame: .zero)
        value.translatesAutoresizingMaskIntoConstraints = false
        value.textColor = .white
        value.text = "TEXTO"
        return value
    }()
    
    
    private let textLabelEUR: UILabel = {
        let value = UILabel(frame: .zero)
        value.translatesAutoresizingMaskIntoConstraints = false
        value.textColor = .white
        value.text = "TEXTO"
        return value
    }()
    
    
    private let maximoEUR: UILabel = {
        let value = UILabel(frame: .zero)
        value.translatesAutoresizingMaskIntoConstraints = false
        value.text = "TEXTO"
        value.textColor = .white
        return value
    }()
    private let minimoEUR: UILabel = {
        let value = UILabel(frame: .zero)
        value.translatesAutoresizingMaskIntoConstraints = false
        value.text = "TEXTO"
        value.textColor = .white
        return value
    }()
    private let dateEUR: UILabel = {
        let value = UILabel(frame: .zero)
        value.translatesAutoresizingMaskIntoConstraints = false
        value.text = "TEXTO"
        value.textColor = .white
        return value
    }()
    
    
    func getitem(){
        let services: apiServices = .init()
        
        services.getAllDataUSD { CoinModel in
            self.textLabelUSD.text = CoinModel?.usdbrl.code
            self.maximoUSD.text = CoinModel?.usdbrl.high
            self.minimoUSD.text = CoinModel?.usdbrl.low
            self.dateUSD.text = CoinModel?.usdbrl.createDate
        }
        
        services.getAllDataEUR { CoinModelEUR in
            self.textLabelEUR.text = CoinModelEUR?.eurbrl.code
            self.maximoEUR.text = CoinModelEUR?.eurbrl.high
            self.minimoEUR.text = CoinModelEUR?.eurbrl.low
            self.dateEUR.text = CoinModelEUR?.eurbrl.createDate
        }
        
    }
    
    private let maxLabelUSD: UILabel = {
        let value = UILabel(frame: .zero)
        value.translatesAutoresizingMaskIntoConstraints = false
        value.text = "Max"
        value.textColor = .white
        return value
    }()
    private let minLabelUSD: UILabel = {
        let value = UILabel(frame: .zero)
        value.translatesAutoresizingMaskIntoConstraints = false
        value.text = "Min"
        value.textColor = .white
        return value
    }()
    
    private let maxLabelEUR: UILabel = {
        let value = UILabel(frame: .zero)
        value.translatesAutoresizingMaskIntoConstraints = false
        value.text = "Max"
        value.textColor = .white
        return value
    }()
    private let minLabelEUR: UILabel = {
        let value = UILabel(frame: .zero)
        value.translatesAutoresizingMaskIntoConstraints = false
        value.text = "Min"
        value.textColor = .white
        return value
    }()
    
    func buildViewHierarchy() {
        self.addSubview(maxLabelUSD)
        self.addSubview(minLabelUSD)
        self.addSubview(maxLabelEUR)
        self.addSubview(minLabelEUR)
        self.addSubview(textLabelUSD)
        self.addSubview(maximoUSD)
        self.addSubview(minimoUSD)
        self.addSubview(textLabelEUR)
        self.addSubview(maximoEUR)
        self.addSubview(minimoEUR)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            self.textLabelUSD.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50),
            self.textLabelUSD.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            
            self.maximoUSD.topAnchor.constraint(equalTo: self.textLabelUSD.bottomAnchor, constant: 10),
            
            self.maximoUSD.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            self.maximoUSD.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            
            self.maxLabelUSD.topAnchor.constraint(equalTo: self.textLabelUSD.bottomAnchor, constant: 10),
            self.maxLabelUSD.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 128),
            self.maxLabelUSD.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -128),
            
            self.minimoUSD.topAnchor.constraint(equalTo: self.maximoUSD.bottomAnchor, constant: 10),
            self.minimoUSD.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            self.minimoUSD.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            
            self.minLabelUSD.topAnchor.constraint(equalTo: self.maximoUSD.bottomAnchor, constant: 10),
            self.minLabelUSD.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 128),
            self.minLabelUSD.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -128),
            
            self.textLabelEUR.topAnchor.constraint(equalTo: self.maximoUSD.bottomAnchor, constant: 50),
            self.textLabelEUR.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            
            self.maximoEUR.topAnchor.constraint(equalTo: self.textLabelEUR.bottomAnchor, constant: 10),
            self.maximoEUR.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            self.maximoEUR.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
     
            self.maxLabelEUR.topAnchor.constraint(equalTo: self.textLabelEUR.bottomAnchor, constant: 10),
            self.maxLabelEUR.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 128),
            self.maxLabelEUR.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -128),
            
            self.minimoEUR.topAnchor.constraint(equalTo: self.maximoEUR.bottomAnchor, constant: 10),
            self.minimoEUR.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            self.minimoEUR.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
          
            self.minLabelEUR.topAnchor.constraint(equalTo: self.maximoEUR.bottomAnchor, constant: 10),
            self.minLabelEUR.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 128),
            self.minLabelEUR.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -128),
            
        ])
    }
    
    func extraSetupConfiguration() {
        
    }
    
}
