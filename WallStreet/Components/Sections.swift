//
//  Sections.swift
//  WallStreet
//
//  Created by Vansh Sharma on 24/03/25.
//

import SwiftUI

struct Sections: View {
    @Binding var selectedCategory: String?  // Accept Binding
    let categories = ["Dark", "Architecture", "Cartoon", "Animal", "Landscape", "Space", "Abstract", "Superhero", "Illustration", "Aesthetic", "Minimalistic", "Anime", "Cars"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(categories, id: \.self) { category in
                    Button(action: {
                        selectedCategory = (selectedCategory == category) ? nil : category
                        print(selectedCategory ?? "All")
                    }) {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(selectedCategory == category ? Color("T1") : Color("Hf1"))
                            .frame(width: categoryWidth(category), height: 50)
                            .overlay {
                                Text(category)
                                    .bold()
                                    .font(.system(size: 24))
                                    .foregroundColor(Color("text"))
                            }
                    }
                }
            }
            .padding()
        }
    }
    
    private func categoryWidth(_ category: String) -> CGFloat {
        let widths: [String: CGFloat] = [
            "Dark": 100, "Architecture": 180, "Cartoon": 130, "Animal": 120,
            "Landscape": 175, "Space": 115, "Abstract": 145, "Superhero": 155,
            "Illustration": 165, "Aesthetic": 145, "Minimalistic": 180, "Anime": 120, "Cars": 100
        ]
        return widths[category] ?? 130
    }
}


#Preview {
    Sections(selectedCategory: .constant(nil))
}
