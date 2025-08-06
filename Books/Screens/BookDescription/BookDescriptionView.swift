//
//  BookDescriptionView.swift
//  Books
//
//  Created by Ксения Панкратова on 29.07.2025.
//

import Foundation
import SwiftUI

struct BookDescriptionView: View {
    @Environment(Coordinator.self) var coordinator
    @State var viewModel: BookDescriptionProtocols
    @State private var isEditing = false

    var body: some View {
        ScrollView {
            ImageView(image: viewModel.book.coverURL)
            VStack(alignment: .leading) {
                title
                VStack(alignment: .leading, spacing: 20) {
                    description
                    notes
                    quotes
                    deleteButton
                }
                .padding(.vertical, 10)
            }
            .padding(.horizontal, 20)
            .navigationTitle(Constants.navigationTitle)
            .toolbar {
                Button(isEditing ? "Готово" : "Ред.") {
                    isEditing.toggle()
                }
            }
            .alert(Constants.errorTitle, isPresented: $viewModel.showAlert) {
                Button(Constants.errorButton, role: .cancel) { viewModel.showAlert = false }
            } message: {
                Text(viewModel.errorMessage ?? "")
            }
        }
    }
}

// MARK: - Constants

extension BookDescriptionView {
    enum Constants {
        static let navigationTitle = "Описание книги"
        static let errorTitle = "Ошибка"
        static let errorButton = "ОК"
    }
}
