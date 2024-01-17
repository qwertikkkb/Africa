//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Nicolai Bodean on 04.12.2023.
//

import SwiftUI

struct AnimalDetailView: View {
    let animal: Animal
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20){
                //Hero image
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                //Title
                Text(animal.name)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24))
                
                //Headline
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                
                //Gallery
                Group{
                    HeadingView(
                        headingImage: "photo.on.rectangle.angled",
                        headingText: "Wilderness in Picture")
                    
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                
                //Facts
                Group {
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    InsetFactView(animal: animal)
                }
                .padding(.horizontal)
                
                //Descriptions
                Group {
                    HeadingView(headingImage: "info.circle", headingText: "All About \(animal.name)")
                    
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                    
                }//Group
                .padding(.horizontal)
                
                //Map
                Group {
                    HeadingView(headingImage: "map", headingText: "Nationals Parks")
                    InsetMapView()
                }//Group
                .padding(.horizontal)
                
                //Link
                Group{
                    HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                    
                    ExternalWeblinkView(animal: animal)
                    
                }//Group
                .padding(.horizontal)
                
            }//VSTack
            .navigationBarTitle("Learn about \(animal.name)",
        displayMode: .inline)
        }//Scroll
    }
}

struct AnimalDetailView_Preview: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        NavigationView {
            AnimalDetailView(animal: animals[0])
        }
        .previewDevice("iPhone 11 pro")
    }
}
