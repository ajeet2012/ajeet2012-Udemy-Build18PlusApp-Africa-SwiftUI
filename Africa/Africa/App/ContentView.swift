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
        
        
        
        NavigationView {
            
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimaListItemView(animal: animal)
                            } //: LINK
                        } //: LOOP
                        
                        CreditsView()
                            .modifier(CenterModifier())
                    } //: LIST
                    .listStyle(.plain)
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                } //: LINK
                            } //: LOOP
                        } //: GRID
                        .padding(10)
                        .animation(.easeIn, value: gridLayout)
                    } //: SCROLL
                } //: CONDITION
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
            
        }
    }
}

#Preview {
    ContentView()
}
