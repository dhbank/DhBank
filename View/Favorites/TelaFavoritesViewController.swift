//
//  TelaFavoritesViewController.swift
//  DhBank
//
//  Created by Lucas on 22/10/21.
//

import UIKit

class TelaFavoritesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let dataSource = DataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCellsTableView()
        searchBar.searchTextField.backgroundColor = .white
        
    }
    
    
    
    
    
    func setupCellsTableView(){
        
        dataSource.data.removeAll()
        
        //MARK: Celula RecipesCustomCell
        
        let defaults = UserDefaults.standard
        defaults.set("100,00", forKey: "valorUser")
        let Dolar = CelulaComXibModel(nomeLabel1: "EUR", nomeLabel2: "R$ \(UserDefaults.standard.object(forKey: "valorUser"))")
            
        let Euro = CelulaComXibModel(nomeLabel1: "USD", nomeLabel2: "U$ 30,00")
        
        dataSource.data.append(Dolar)
        dataSource.data.append(Euro)
        dataSource.data.append(Dolar)
        dataSource.data.append(Euro)
        dataSource.data.append(Dolar)
        dataSource.data.append(Euro)
        dataSource.data.append(Dolar)
        dataSource.data.append(Euro)
        
        dataSource.initializeTableView(tableView: tableView)
        // Do any additional setup after loading the view.
        
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.contentInset = UIEdgeInsets(top: 60, left: 0, bottom: 60, right: 0)
        
    }
    
    // esconde o teclado
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        searchBar.endEditing(true)
    }
}
