//
//  GalleryView.swift
//  Africa
//
//  Created by Nicolai Bodean on 28.11.2023.
//

import SwiftUI

struct GalleryView: View {
    
    @State private var selectedAnimal: String = "lion"
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .heavy)
    
    
    //Simple grid definition
    //let gridLayout: [GridItem] = [
    //                 GridItem(.flexible()),
    //                 GridItem(.flexible()),
    //                 GridItem(.flexible())
    //]
    
    //Eficient grid definition
   // let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    
    //Dynamic Grid Layout
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    
    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
            //Grid
            
            
            VStack(alignment: .center, spacing: 30) {
                //Image
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                
                //Slider
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn, perform:{ value in
                    gridSwitch()
                    })
                
                //Grid
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                haptics.impactOccurred()
                            }
                    }//loop
                }//VStack
                .padding(.horizontal, 10)
                .padding(.vertical, 50)
            }//Grid
            .animation(.easeIn)
            .onAppear(perform: {
                gridSwitch()
            })
        }//SCroll
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

#Preview {
    GalleryView()
}
