//
//  Persistent.swift
//  MyCoreData
//
//  Created by 市川真希 on 2024/05/15.
//

import CoreData

struct PersistenceController {
    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "MyCoreData")

        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error as NSError? {
                fatalError("unresolved error \(error)")
            }
        })
    }
}
