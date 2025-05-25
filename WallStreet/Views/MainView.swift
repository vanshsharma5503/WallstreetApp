//
//  MainVIew.swift
//  WallStreet
//
//  Created by Vansh Sharma on 24/03/25.
//

import SwiftUI

struct MainView: View {
    @State private var selectedWallpaper: Wallpaper? = nil

    var body: some View {
        NavigationStack {
            VStack {
                HeaderTexts()
                
                HStack {
                    Image("launcher")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .scaledToFit()
                        .padding()
                    Text("WallStreet")
                        .font(.custom("Pacifico-Regular", size: 50))
                }

                WallpaperSection(selectedWallpaper: $selectedWallpaper)  // Pass binding
                    .offset(y: -40)
            }
            .navigationDestination(item: $selectedWallpaper) { wallpaper in
                WallpaperView(wallpaper: wallpaper)  // Navigate when wallpaper is selected
            }
        }
    }
}

#Preview {
    MainView()
}
