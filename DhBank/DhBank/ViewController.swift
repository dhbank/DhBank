//
//  ViewController.swift
//  DhBank
//
//  Created by Eduardo Escaleira on 20/10/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInFacebookButton(_ sender: Any) {
        performSegue(withIdentifier: "bemVindoSegue", sender: nil)
    }
    
    @IBAction func signInGoogleButton(_ sender: Any) {
        performSegue(withIdentifier: "bemVindoSegue", sender: nil)
    }
    
    
}

