//
//  ExternalWeblinkView.swift
//  Africa
//
//  Created by Nicolai Bodean on 04.12.2023.
//

import SwiftUI

struct ExternalWeblinkView: View {
    let animal: Animal
    
    var body: some View {
        Group {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    
                    Link(animal.name, destination: URL(string: animal.link) ?? URL(string: "http://wikipedia.org")!)
                }
                .foregroundColor(.accentColor)
            }//HStack
        }//box
    }
}

struct ExternalWeblink_Preview: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        ExternalWeblinkView(animal: animals[0])
        .previewLayout(.sizeThatFits)
        .padding()
}
}
