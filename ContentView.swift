//
//  ContentView.swift
//  DesignDemoApp
//
//  Created by Ozan Kocakaya on 31.08.23.
//

import SwiftUI

struct ContentView: View {
    
    @State var pets: [PetModel] = dummyPetData
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(pets) {
                    pet in
                    NavigationLink(destination: Image(pet.imageName)) {
                        SingleRowView(pet: pet)
                            .contextMenu(ContextMenu(menuItems: {
                                Button(action: {}, label: {
                                    Label("Favorite", systemImage: "star.fill")
                                })
                            }))
                        
                    }
                }
                .onDelete(perform: {
                    IndexSet in
                    if let i = IndexSet.first {
                        pets.remove(at: i)
                    }
                })
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Pets")
            .navigationBarItems(trailing:
            Button(action: {
                pets.append(PetModel.cat2)
            }, label: {
                Image(systemName: "plus.circle.fill")
                Text("Add Pet")
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK - Model

struct PetModel: Identifiable {
    var id = UUID()
    var name: String
    var type: String
    var imageName: String
}

extension PetModel {
    static var cat1 = PetModel(name: "Grumpy Cat",
                               type: "Britisch Kurzhaar",
                               imageName: "cat1")
    static var cat2 = PetModel(name: "Suspicious Cat",
                               type: "Hauskatze",
                               imageName: "cat2")
    static var cat3 = PetModel(name: "Sneaky Cat",
                               type: "Ragdoll Katze",
                               imageName: "cat3")
}

let dummyPetData = [PetModel.cat1,
                    PetModel.cat2,
                    PetModel.cat3]
