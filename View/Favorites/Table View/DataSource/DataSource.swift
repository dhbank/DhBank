//
//  DataSource.swift
//  Exemplo_Xib_2
//
//  Created by Lucas on 21/10/21.
//

import UIKit

class DataSource: NSObject {

    var data = [Any]()
    
    func initializeTableView(tableView : UITableView){
        
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "CelulaComXibModelCell", bundle: Bundle.main), forCellReuseIdentifier: "CelulaComXibModelCellIdentifier")
        
    }
    
}

extension DataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let CelulaComXibModelCell = data[indexPath.row] as? CelulaComXibModel {
            return CelulaComXibModelCell.cellForTableView(tableView: tableView, atIndexPath: indexPath)
        
        } else {
            return UITableViewCell()
            
        }
    }
    
    
}
