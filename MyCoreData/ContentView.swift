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
    @State var name = ""
    var body: some View {
        List{
            TextField("人間の名前", text: $name).onSubmit{addHuman()}
            Button(action: deleteHuman) {
                Text("人間を減らす")
            }
            ForEach(humans) { human in
                if((human.name?.isEmpty) == false) {
                    HStack {
                        if(human.checked){
                            Text("☑️")
                        } else {
                            Text("⬜️")
                        }
                        Button(action: {
                            human.checked.toggle()
                        }){
                            Text(human.name!)
                        }
                    }
                }
                
            }
        }
    }
    func addHuman() {
        let newhuman = Human(context: viewContext)
        newhuman.name = name

        do {
            try viewContext.save()
        } catch {
            fatalError("保存に失敗")
        }
        name = ""
    }
    func deleteHuman() {
        for human in humans {
            if(human.checked) {
                viewContext.delete(human)
            }
        }
        do{
            try viewContext.save()
        } catch {
            fatalError("セーブに失敗")
        }
    }
}

#Preview {
    ContentView()
}
