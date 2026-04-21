//
//  ContentView.swift
//  Africa
//
//  Created by Ajeet Sharma on 18/04/26.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - PROPERTIES
    let animals: [Animal] = Bundle.main.decode("animals.json")
    @State private var selectedAnimal: Animal?
    //MARK: - BODY
    
//    init() {
//            let animals = Bundle.main.decode("animals.json") as [Animal]
//            _selectedAnimal = State(initialValue: animals.first)
//        }
//    
    var body: some View {
        
        
        
        NavigationSplitView {
                    
                    // LEFT SIDE (List / Sidebar)
                    List(selection: $selectedAnimal) {
                        
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets())
                            .listRowSeparator(.hidden)
                        
                        ForEach(animals) { animal in
                            AnimaListItemView(animal: animal)
                                .tag(animal) // 🔥 VERY IMPORTANT
                        }
                    }
                    .navigationTitle("Africa")
                    
                } detail: {
                    
                    // RIGHT SIDE (Detail)
                    if let selectedAnimal {
                        AnimalDetailView(animal: selectedAnimal)
                    } else {
                        Text("Select an Animal")
                            .font(.title2)
                            .foregroundStyle(.secondary)
                    }
                }
    }
}

#Preview {
    ContentView()
}
