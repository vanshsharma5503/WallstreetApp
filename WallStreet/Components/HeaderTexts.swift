//
//  HeaderTexts.swift
//  WallStreet
//
//  Created by Vansh Sharma on 24/03/25.
//

import SwiftUI

struct HeaderTexts: View {
    @State private var texts = [
        "Explore beautiful wallpapers",
        "Find the perfect background",
        "High-quality images",
        "Frequently updated with new walls"
    ]
    
    @State private var currentIndex = 0
    @State private var offsetY: CGFloat = 0
    @State private var opacity: Double = 1.0
    
    var body: some View {
        VStack {
            Text(texts[currentIndex])
//                .font(.title2)
                .font(.system(size: 25))
                .bold()
                .offset(y: offsetY)
                .opacity(opacity)
                .foregroundColor(Color("Hf1"))
                .onAppear {
                    startAnimationLoop()
                }
        }
    }
    
    func startAnimationLoop() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.easeInOut(duration: 1)) {
                offsetY = -50 // Move text upward
                opacity = 0 // Fade out
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                currentIndex = (currentIndex + 1) % texts.count // Cycle through texts
                offsetY = 50 // Reset below
                
                withAnimation(.easeInOut(duration: 1)) {
                    offsetY = 0 // Move to normal position
                    opacity = 1 // Fade in smoothly
                }
                
                // Restart loop
                startAnimationLoop()
            }
        }
    }
}



#Preview {
    HeaderTexts()
}
