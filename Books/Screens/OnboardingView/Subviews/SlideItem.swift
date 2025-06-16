//
//  SlideItem.swift
//  Books
//
//  Created by Ксения Панкратова on 16.06.2025.
//

import SwiftUI

struct SlideItem: View {
    var tag: Int
    var imageName: String
    var description: String

    var body: some View {
        VStack(spacing: 25) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180)
                .padding(.horizontal, 60)
            Text(description)
                .font(.custom("Roboto-Light", size: 18))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 60)
        }
        .tag(tag)
    }
}
