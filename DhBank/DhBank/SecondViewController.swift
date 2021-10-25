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
    @IBOutlet var naoMostrarNovamenteButton: UIButton!
    @IBOutlet var textoBoasVindasLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
  
        naoMostrarNovamenteButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        
    }
    
    

    @IBAction func SeguirButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "dhbankSegue", sender: nil)
    }
    
    @IBAction func checkBoxPressed(_ buttonPressed: UIButton) {
        buttonPressed.isSelected.toggle()
        }
        
    }
    
    

