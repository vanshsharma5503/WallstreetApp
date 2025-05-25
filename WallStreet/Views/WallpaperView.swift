//
//  WallpaperView.swift
//  WallStreet
//
//  Created by Vansh Sharma on 25/03/25.
//

import SwiftUI

import SwiftUI

struct WallpaperView: View {
    let wallpaper: Wallpaper  // Your Wallpaper model
    @State private var showAlert = false
    @Environment(\.presentationMode) var presentationMode  // To handle back navigation

    var body: some View {
        ZStack(alignment: .topLeading) {
            // Wallpaper Image covering full screen
            AsyncImage(url: URL(string: wallpaper.thumbnailUrl)) { image in
                image.resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .ignoresSafeArea()
            } placeholder: {
                ProgressView()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .background(Color.gray.opacity(0.2))
                    .ignoresSafeArea()
            }

            // Overlay: Back Button and Apply Button
            VStack {
                // Back Button
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color("Hf1"))
                                .frame(width: 50, height: 50)

                            Image(systemName: "chevron.left")
                                .font(.title2)
                                .foregroundColor(Color("text"))
                        }
                    }
                    .padding(.top, 50)
                    .padding(.leading, 20)

                    Spacer()
                }

                Spacer()

                // Apply Wallpaper Button
                Button(action: {
                    showAlert = true
                }) {
                    HStack {
                        Image(systemName: "paintbrush")
                        Text("Apply Wallpaper")
                    }
                    .font(.title2)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("Hf1"))
                    .foregroundColor(Color("text"))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .padding(.bottom, 40)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Apply Wallpaper", isPresented: $showAlert) {
//            Button("Home Screen", role: .none) { applyWallpaper(type: "Home") }
//            Button("Lock Screen", role: .none) { applyWallpaper(type: "Lock") }
//            Button("Both", role: .none) { applyWallpaper(type: "Both") }
            Button("Download", role: .none) { downloadWallpaper() }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Choose where to apply the wallpaper")
        }
    }

    // Functions for wallpaper actions
    func applyWallpaper(type: String) {
        print("Applied to \(type)")
    }

    func downloadWallpaper() {
        guard let url = URL(string: wallpaper.imageUrl) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let image = UIImage(data: data) {
                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                DispatchQueue.main.async {
                    showAlert = false
                    // Optional: Present another alert to confirm success
                }
            } else {
                print("Failed to download image: \(error?.localizedDescription ?? "Unknown error")")
            }
        }.resume()
    }
}




#Preview {
    WallpaperView(wallpaper: Wallpaper(category: "Dark", imageUrl: "https://starkdroid.github.io/WallStreet-API/mobile/461433874_27139799912333853_7427491343784428746_n.jpg", thumbnailUrl: "https://starkdroid.github.io/WallStreet-API/mobile/thumbnail/461433874_27139799912333853_7427491343784428746_n.webp"))
}

