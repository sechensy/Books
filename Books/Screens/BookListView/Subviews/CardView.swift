//
//  CardView.swift
//  Books
//
//  Created by Ксения Панкратова on 23.06.2025.
//

import SwiftUI

struct CardView: View {
    var book: Book
    var body: some View {
        HStack {
            if let data = book.coverURL, let image = UIImage(data: data) {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 102, height: 151)
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 102, height: 151)
            }
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(book.name ?? Constants.noTitleText)
                        .font(.custom("Roboto", size: 18))
                    Text(book.author ?? Constants.noAuthorText)
                        .font(.custom("Roboto", size: 16))
                        .foregroundStyle(.text)
                }
                Text(book.bookDescription ?? Constants.noDiscriptText)
                    .font(.custom("Roboto", size: 11))
                    .foregroundStyle(.text)
            }
        }
    }
}

extension CardView {
    enum Constants {
        static let noTitleText = "Нет названия"
        static let noAuthorText = "Нет автора"
        static let noDiscriptText = "Нет описания"
    }
}
