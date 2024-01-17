//
//  ContentView.swift
//  Africa
//
//  Created by Nicolai Bodean on 28.11.2023.
//

import SwiftUI

struct ContentView: View {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .heavy)
    
    @State private var isGridActive = false
    
    @State private var gridLayout: [GridItem] = [ GridItem(.flexible()) ]
    @State private var gridColumn: Int = 1
    @State private var toolBarIcon: String = "square.grid.2x2"
    
    //functions
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("Grid Number \(gridColumn)")
        
        //Tooldbar image
        switch gridColumn {
        case 1:
            toolBarIcon = "square.grid.2x2"
        case 2:
            toolBarIcon = "square.grid.3x2"
        case 3:
            toolBarIcon = "rectangle.grid.1x2"
        default:
            toolBarIcon = "square.grid.2x2"
        }
    }
    
    var body: some View {
        
        NavigationView {
            Group {
                if !isGridActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }//Link
                        }//Loop
                        Credits() 
                            .modifier(CenterModifier())
                    }//List
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                }//Link
                            }//Loop
                        }//lazyvgrid
                        .padding(10)
                        .animation(.easeIn)
                    }//Scroll
                }// Condition
            }// Group
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 26) {
                        //List
                        Button(action: {
                            print("List view is activated")
                            isGridActive = false
                            haptics.impactOccurred()
                           
                        }) {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridActive ? .primary : .accentColor)
                        }
                        //Grid
                        Button(action: {
                            print("Grid view is activated")
                            isGridActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        }) {
                            Image(systemName: toolBarIcon)
                                .font(.title2)
                                .foregroundColor(isGridActive ? .accentColor : .primary)
                        }
                    }
                }
            }//NavigationView
        }
    }
}

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .previewDevice("iPhone 11 Pro")
        }
    }

