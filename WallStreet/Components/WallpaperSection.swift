//
//  WallpaperSection.swift
//  WallStreet
//
//  Created by Vansh Sharma on 24/03/25.
//

import SwiftUI

import SwiftUI

struct WallpaperSection: View {
    @StateObject private var viewModel = WallpaperViewModel()
    @Binding var selectedWallpaper: Wallpaper?  // Added Binding

    var body: some View {
        VStack {
            Sections(selectedCategory: $viewModel.selectedCategory)

            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 5) {
                    ForEach(viewModel.filteredWallpapers) { wallpaper in
                        Button(action: {
                            selectedWallpaper = wallpaper  // Set selected wallpaper
                        }) {
                            AsyncImage(url: URL(string: wallpaper.thumbnailUrl)) { image in
                                image.resizable()
                                    .scaledToFill()
                                    .frame(width: 180, height: 320)
                                    .clipped()
                                    .cornerRadius(20)
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 180, height: 320)
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .onAppear {
            viewModel.fetchWallpapers()
        }
    }
}

#Preview {
    @State var previewSelectedWallpaper: Wallpaper? = nil
    return WallpaperSection(selectedWallpaper: $previewSelectedWallpaper)
}



