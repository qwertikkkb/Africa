//
//  HeadingView.swift
//  Africa
//
//  Created by Nicolai Bodean on 04.12.2023.
//

import SwiftUI

struct HeadingView: View {
    var headingImage: String
    var headingText:  String
    
    var body: some View {
        HStack {
          Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }//HStack
        .padding(.vertical)
    }
}

#Preview {
    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
        .previewLayout(.sizeThatFits)
        .padding()
}
