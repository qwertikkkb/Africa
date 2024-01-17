//
//  CenterModifier.swift
//  Africa
//
//  Created by Nicolai Bodean on 16.12.2023.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
