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
    @State private var isGridViewActive: Bool = false
    @State private var selectedAnimal: Animal?
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    func gridSwtich() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("Grid column - \(gridColumn)")
        switch gridColumn {
            case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    
    //MARK: - BODY
    
    //    init() {
    //            let animals = Bundle.main.decode("animals.json") as [Animal]
    //            _selectedAnimal = State(initialValue: animals.first)
    //        }
    //
    var body: some View {
        
        
        
        NavigationSplitView {
            
            Group {
                if !isGridViewActive {
                    List(selection: $selectedAnimal) {
                        
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets())
                            .listRowSeparator(.hidden)
                        
                        ForEach(animals) { animal in
                            AnimaListItemView(animal: animal)
                                .tag(animal) // 🔥 VERY IMPORTANT
                        }//: LOOP
                    }
                }//: LIST
                else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                }
                            }
                        }//: GRID
                        .padding()
                        .animation(.easeInOut(duration: 1.0), value: gridColumn) // ✅ FIX
                    }//: SCROLL
                }
            }//: GROUP
            .navigationTitle("Africa")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: 16) {
                        //LIST
                        Button {
                            isGridViewActive = false
                            
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundStyle(isGridViewActive ? .primary : Color.accentColor)
                            
                        }
                        
                        //GRID
                        
                        Button {
                            isGridViewActive = true
                            gridSwtich()
                        } label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundStyle(isGridViewActive ? Color.accentColor : .primary)
                            
                        }
                        
                    }//: HSTACK
                }
            }//: TOOL BAR
            
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
