//
//  MyCoreDataApp.swift
//  MyCoreData
//
//  Created by 市川真希 on 2024/05/15.
//

import SwiftUI

@main
struct MyCoreDataApp: App {
    let persistenceController = PersistenceController()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
