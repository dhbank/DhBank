//
//  WelcomeFeedBackViewController.swift
//  DhBank
//
//  Created by Diego Honório on 12/01/22.
//

import UIKit

class WelcomeFeedBackViewController: UIViewController {

    private let welcomeFeedBackView: WelcomeFeedBackView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func loadView() {
        view = welcomeFeedBackView
    }
    
    init(){
        self.welcomeFeedBackView = WelcomeFeedBackView()
        super.init(nibName: nil, bundle: nil)
        self.welcomeFeedBackView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension WelcomeFeedBackViewController: WelcomeFeedBackViewDelegate {
  
    func goto() {
        
        let vc = HomeViewController()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true)
    }

    
}

