//
//  CoreDataManager.swift
//  SwiftUI_CoreData_Demo
//
//  Created by Code Swiftly on 03/02/21.
//

import Foundation
import CoreData

class CoreDataManager: ObservableObject {

    static var shared = CoreDataManager()
    
    private init() {
        persistantContainer.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    public var context: NSManagedObjectContext {
        get {
            return self.persistantContainer.viewContext
        }
    }
    
    var persistantContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "SwiftUI_CoreData_Demo")
        container.loadPersistentStores { (storeDesc, error) in
            guard error ==  nil  else {
                print("\(String(describing: error?.localizedDescription))")
                return
            }
        }
        return container
    }()
    
    func save() -> Void {
        let context = persistantContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch let error {
                print("\(error.localizedDescription)")
            }
        }
    }
}
