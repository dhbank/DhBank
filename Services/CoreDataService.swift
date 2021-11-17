//
//  CoreDataService.swift
//  DhBank
//
//  Created by Diego Honorio on 17/11/21.
//

import Foundation
import UIKit

class CoreDataService {
    
     private var checkpoints: Bool = false
    private let context = ((UIApplication.shared.delegate)
                  as! AppDelegate)
       .persistentContainer
       .viewContext
   
        
     func verificarBool() -> Bool  {
        do {
//            checkpoints = try context.fetch(CheckPoint.fetchRequest())
            
            
        } catch {
            
        }
         return true
    }
    
}
