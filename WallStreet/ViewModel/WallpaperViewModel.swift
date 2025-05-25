//
//  WallpaperViewModel.swift
//  WallStreet
//
//  Created by Vansh Sharma on 25/03/25.
//

import Foundation

class WallpaperViewModel: ObservableObject {
    @Published var wallpapers: [Wallpaper] = []
    @Published var selectedCategory: String? = nil  // Connected to Sections view

    func fetchWallpapers() {
        guard let url = URL(string: "http://localhost:3000/wallpapers") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            do {
                let decodedResponse = try JSONDecoder().decode([Wallpaper].self, from: data)
                DispatchQueue.main.async {
                    self.wallpapers = decodedResponse
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }

    var filteredWallpapers: [Wallpaper] {
        if let category = selectedCategory {
            return wallpapers.filter { $0.category == category }
        } else {
            return wallpapers  // Show all if no section selected
        }
    }
}

