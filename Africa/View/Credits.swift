//
//  Credits.swift
//  Africa
//
//  Created by Nicolai Bodean on 16.12.2023.
//

import SwiftUI

struct Credits: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            
            Text("""
    Copuright © qwertikkk
    All right reserved
    Better Apps ♡ less Code
    """)
            .font(.footnote)
        .multilineTextAlignment(.center)
        }//VStack
        .padding()
        .opacity(0.4)
        
    }
}

#Preview {
    Credits()
        .previewLayout(.sizeThatFits)
        .padding()
}

