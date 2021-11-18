//
//  TelaFavoritesViewController.swift
//  DhBank
//
//  Created by Lucas on 22/10/21.
//

import UIKit

class TelaFavoritesViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
    private let dataSource = DataSource()
    private let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCellsTableView()
        searchBar.searchTextField.backgroundColor = .white
        
    }
    
    func setupCellsTableView(){
        
        dataSource.data.removeAll()
        
        //MARK: Celula RecipesCustomCell
        
        defaults.set("100,00", forKey: "valorUser")
        
        let Dolar = CelulaComXibModel(nomeLabel1: "EUR", nomeLabel2: "R$ \(defaults.object(forKey: "valorUser") ?? "---")")
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
