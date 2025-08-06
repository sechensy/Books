//
//  BookNotesCard.swift
//  Books
//
//  Created by Ксения Панкратова on 29.07.2025.
//

import Foundation
import SwiftUI

struct BookNotesCard: View {
    var date: String
    var text: String
    var deleteNote: (() -> Void)? = nil

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(date)
                    .font(.custom("Roboto-ExtraLight", size: 12))
                Text(text)
                    .font(.custom("Roboto-Light", size: 12))
            }
            .padding(.horizontal, 17)
            .padding(.vertical, 6)

        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.lightGrayCust)
        .cornerRadius(11)
        .swipeActions {
            Button(role: .destructive) {
                deleteNote?()
            } label: {
                Label("Удалить", systemImage: "trash")
            }
        }
    }
}
