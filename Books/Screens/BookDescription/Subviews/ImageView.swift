//
//  ImageView.swift
//  Books
//
//  Created by Ксения Панкратова on 29.07.2025.
//

import Foundation
import SwiftUI

struct ImageView: View {
    let image: Data?

    var body: some View {
        GeometryReader { geometry in
            let minY = geometry.frame(in: .global).minY
            let iscrolling = minY > 0

            if let data = image, let image = UIImage(data: data) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width,
                           height: iscrolling ? 150 + minY: 150)
                    .clipped()
                    .offset(y: iscrolling ? -minY : 0)
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: geometry.size.width,
                           height: iscrolling ? 150 + minY: 150)
                    .clipped()
                    .offset(y: iscrolling ? -minY : 0)
            }
        }
        .frame(height: 150)
    }
}
