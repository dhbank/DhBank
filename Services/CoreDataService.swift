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

            let result = try context.fetch(CheckPoint.fetchRequest()) as? [CheckPoint]
            
            if let data = result?.first {
                return data.checkpoint
                
            } else {
                return false
            }
            
        } catch {
            
            return false
        }

    }
    
    func adicionarInfo(checkpoint: Bool) -> Bool {
        let check: CheckPoint = .init(context: context)
        check.checkpoint = checkpoint
        saveContext()
        
        return verificarBool()
    }
    
    
    private func saveContext() {
            do {
                try context.save()
            } catch {
                
            }
        }
}
