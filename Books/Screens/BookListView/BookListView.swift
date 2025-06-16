//
//  BookListView.swift
//  Books
//
//  Created by Ксения Панкратова on 16.06.2025.
//

import Foundation
import SwiftUI

struct BookListView: View {
    @Environment(StartScreenViewModel.self) private var startScreenViewModel

    var body: some View {
        VStack {
            Button("Выход") {
                startScreenViewModel.updateScreenState(newScreenState: .onboarding)
            }
        }
    }
}

// MARK: - Constants

private extension BookListView {
    enum Constants {
        static let description = "Сохраняйте книги, которые вы уже прочитали, читаете сейчас или планируете прочесть"
    }
}

// MARK: - Preview

#Preview {
    BookListView()
}
