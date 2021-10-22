//
//  SecondViewController.swift
//  DhBank
//
//  Created by Eduardo Escaleira on 20/10/21.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet var bemVindoLabel: UILabel!
    @IBOutlet var nomeLabel: UILabel!
    @IBOutlet var textoBoasVindasLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func SeguirButtonPressed(_ sender: Any) {
    }
    
    @IBAction func checkBoxPressed(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
        
    }
    
    
}
