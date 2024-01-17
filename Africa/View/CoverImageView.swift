//
//  CoverImageView.swift
//  Africa
//
//  Created by Nicolai Bodean on 28.11.2023.
//

import SwiftUI

struct CoverImageView: View {
    //Mark-Properties
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    
    //Mark-Body
    var body: some View {
        
        TabView{
            ForEach(coverImages) { item in
                Image(item.name)
                     .resizable()
                 .scaledToFill()
            }//Loop
        }//TabView
        .tabViewStyle(PageTabViewStyle())
       
    }
}

#Preview {
    CoverImageView()
}
