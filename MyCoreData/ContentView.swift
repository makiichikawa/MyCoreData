//
//  ContentView.swift
//  MyCoreData
//
//  Created by 市川真希 on 2024/05/15.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: []) var humans : FetchedResults<Human>
    var body: some View {
        List{
            Button(action: addHuman) {
              Text("人間を増やす")
          }
            ForEach(humans) { human in
                if((human.name?.isEmpty) == false) {
                    Text(human.name!)
                }
                
            }
        }
    }

    func addHuman() {
        let newhuman = Human(context: viewContext)
        newhuman.name = "ichikawa"

        do {
            try viewContext.save()
        } catch {
            fatalError("保存に失敗")
        }
    }
}

#Preview {
    ContentView()
}
