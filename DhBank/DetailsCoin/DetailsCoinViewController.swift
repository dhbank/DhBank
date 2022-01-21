//
//  DetailsCoinViewController.swift
//  DhBank
//
//  Created by Diego Honório on 21/01/22.
//


import UIKit

class DetailsCoinViewController: UIViewController {

    private let detailsCoinView: DetailsCoinView
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func loadView() {
        view = detailsCoinView
    }
    
    init(){
        self.detailsCoinView = DetailsCoinView()
        super.init(nibName: nil, bundle: nil)
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
