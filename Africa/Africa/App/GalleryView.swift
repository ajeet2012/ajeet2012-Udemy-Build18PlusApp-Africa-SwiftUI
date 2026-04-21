//
//  GalleryView.swift
//  Africa
//
//  Created by Ajeet Sharma on 18/04/26.
//

import SwiftUI

struct GalleryView: View {
    //MARK: - PROPERTIES
    let animals: [Animal] = Bundle.main.decode("animals.json")
    @State private var selectedAnimal: String = "lion"
    @State private var isImageSelected: Bool = false
    
    //SIMPLE GRID DEFINITION
//    let gridLayout: [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
    
    //EFFICIENT GRID DEFINITION
   // let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible(minimum: 100)), count: 3)
    
    //DYNAMIC GRID LAYOUT
    
    @State private var gridLayout: [GridItem] = Array(repeating: .init(.flexible()), count: Int(3.0))
    @State private var grideColumn: Double = 3.0
    
    //MARK: -  FUNCTION
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(grideColumn))
    }
    
    //MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(alignment: .center, spacing: 30) {
                //MARK: - SELECTED IMAGE
                
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                // MARK: -  SLIDER
                
                Slider(value: $grideColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: grideColumn) { oldValue, newValue in
                        gridSwitch()
                    }
                
                // MARK: -  GRID
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                self.selectedAnimal = item.image
                                isImageSelected.toggle()
                            }
                            .sensoryFeedback(.impact, trigger: isImageSelected)
                    }//: Loop
                }//: LazyVGrid
                .animation(.easeIn, value: gridLayout)
                .onAppear (perform: {
                    gridSwitch()
                })
            } //: VStack
            .padding(.horizontal, 10)
            .padding(.vertical, 20)
        }//: SCROLL
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

#Preview {
    GalleryView()
}

