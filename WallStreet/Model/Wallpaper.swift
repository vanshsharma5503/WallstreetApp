//
//  Wallpaper.swift
//  WallStreet
//
//  Created by Vansh Sharma on 25/03/25.
//

import Foundation

struct WallpaperResponse: Codable {
    let mobile: [Wallpaper]  // Update to match the JSON structure
}

struct Wallpaper: Codable, Identifiable,Hashable {
    let id = UUID()
    let category: String
    let imageUrl: String
    let thumbnailUrl: String

    enum CodingKeys: String, CodingKey {
        case category, imageUrl = "imageUrl", thumbnailUrl = "thumbnailUrl"
    }
}
