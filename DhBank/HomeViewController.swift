//
//  ViewController.swift
//  DhBank
//
//  Created by DiegoH on 29/12/21.
//

import UIKit


class HomeViewController: UIViewController, HomeViewDelegate {

    private let homeView: HomeView
    
    let viewModel: HomeViewModel = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
    }

    override func loadView() {
        view = homeView
    }
    
    init(){
        self.homeView = HomeView()
        super.init(nibName: nil, bundle: nil)
        self.homeView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension HomeViewController: HomeViewModelDelegate {
    func logoutEfetuado() {
        viewModel.efetuarLogout()
        let vc = LoginViewController()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true)
    }
    
    func showAlert(alert: UIAlertController){
        self.present(alert, animated: true, completion: nil)
    }
  
    func shared(){
        let VC = UIActivityViewController(activityItems: ["DHBank"], applicationActivities: nil)
        VC.popoverPresentationController?.sourceView = self.view
        self.present(VC, animated: true, completion: nil)
      
    }
  
    func gotoDetails() {
        let vc = DetailsCoinViewController()
        let navigationVC = UINavigationController(rootViewController: vc)
        self.present(navigationVC, animated: true, completion: nil)
    }
    
}



