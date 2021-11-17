//
//  ViewController.swift
//  DhBank
//
//  Created by Eduardo Escaleira on 20/10/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
   

    @IBOutlet weak var logoIntroAplication: UIView!
    @IBOutlet weak var toopView: UIView!
    @IBOutlet weak var bottonView: UIView!
    
    let viewModel: CoinViewModel = .init()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        starAnimation()
       
        viewModel.delegate = self
        viewModel.getAllData()
    }
    
    
    
    

    @IBAction func signInFacebookButton(_ sender: Any) {
        performSegue(withIdentifier: "bemVindoSegue", sender: nil)
    }
    
    @IBAction func signInGoogleButton(_ sender: Any) {
        performSegue(withIdentifier: "bemVindoSegue", sender: nil)
    }
    
    
    //Mark: - Animation intro
    
    func starAnimation(){
        toopView.translatesAutoresizingMaskIntoConstraints = true
        bottonView.translatesAutoresizingMaskIntoConstraints = true
        UIView.animate(withDuration: 0.7) {
            self.toopView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.center.y + 15)
        }
        
        
        UIView.animate(withDuration: 0.5) {
            self.bottonView.frame = CGRect(x: -150, y: self.view.center.y + 70, width: self.view.frame.size.width + 150, height: self.view.frame.size.height)
        }
        
        UIView.animate(withDuration: 2.5) {
            self.logoIntroAplication.alpha = 0
            self.logoIntroAplication.alpha = 1
            
        }
        
    }
    
}

extension ViewController: CoinViewModelDelegate{
    
    
    func getAllData() {
        print("teste")
    }
    
    
}



