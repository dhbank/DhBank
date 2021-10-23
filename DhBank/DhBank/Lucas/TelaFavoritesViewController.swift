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
        
    }
    
    
    func setupCellsTableView(){
        
        dataSource.data.removeAll()
        
        //MARK: Celula RecipesCustomCell
        let Dolar = CelulaComXibModel(nomeImage: "gradBG", nomeLabel2: "Dolar")
        
        let Euro = CelulaComXibModel(nomeImage: "iosWallpaper", nomeLabel2: "Euro")
        
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
