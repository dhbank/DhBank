//
//  TelaFavoritesViewController.swift
//  DhBank
//
//  Created by Lucas on 22/10/21.
//

import UIKit

class TelaFavoritesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let dataSource = DataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCellsTableView()
        
    }
    
    
    func setupCellsTableView(){
        
        dataSource.data.removeAll()
        
        //MARK: Celula RecipesCustomCell
        let Thiago = CelulaComXibModel(nomeImage: "gradBG", nomeLabel2: "Thiago")
        
        let Lucas = CelulaComXibModel(nomeImage: "iosWallpaper", nomeLabel2: "Lucas")
        
        dataSource.data.append(Thiago)
        dataSource.data.append(Lucas)
        dataSource.data.append(Thiago)
        dataSource.data.append(Lucas)
        dataSource.data.append(Thiago)
        dataSource.data.append(Lucas)
        dataSource.data.append(Thiago)
        dataSource.data.append(Lucas)
        
        dataSource.initializeTableView(tableView: tableView)
        // Do any additional setup after loading the view.
        
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
    }
}
