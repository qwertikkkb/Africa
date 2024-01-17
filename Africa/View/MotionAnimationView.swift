//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Nicolai Bodean on 04.12.2023.
//

import SwiftUI

struct MotionAnimationView: View {
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating = false
    
    //Functions
    
    //1 random coordinate
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    //2 random size
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))
    }
    
    //3 random scale
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    //4 random speed
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1.0)
    }
    
    //5 random delay
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(
                            width: randomSize(),
                            height: randomSize(),
                            alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(
                        x: randomCoordinate(max: geometry.size.width),
                        y: randomCoordinate(max: geometry.size.height))
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay()))
                        .onAppear(perform: {
                            isAnimating = true
                        }
                        )
                }//Loop
            }//ZStack
            .drawingGroup()
        }//Geometry
    }
}

#Preview {
    MotionAnimationView()
}
