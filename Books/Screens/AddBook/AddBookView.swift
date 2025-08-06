//
//  AddBookView.swift
//  Books
//
//  Created by Ксения Панкратова on 30.07.2025.
//

import Foundation
import SwiftUI
import PhotosUI

struct AddBookView: View {
    @State var viewModel: AddBookProtocol
    @Environment(Coordinator.self) private var coordinator

    var body: some View {
        VStack {
            bookCover
                .padding(.bottom, 60)
                .padding(.top, 46)

            VStack(spacing: 30) {

                CustomTextField(title: Constants.title, inputText: $viewModel.book.bookTitle)
                CustomTextField(title: Constants.author, inputText: $viewModel.book.author)

                descriptionField

                CustomButton(Constants.addBook) {
                    viewModel.addBook()
                }
                .disabled(!viewModel.validation())
                .opacity(viewModel.validation() ? 1 : 0.5)
                Spacer()
            }
        }
        .alert(Constants.errorTitle, isPresented: $viewModel.showErrorMessage) {
            Button(Constants.errorButton, role: .cancel) { viewModel.showErrorMessage = false }
        } message: {
            Text(viewModel.errorMessage ?? "")
        }
        .onAppear {
            viewModel.setCoordinator(coordinator)
        }
        .padding(.horizontal, 27)
        .navigationTitle(Constants.navigationTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

extension AddBookView {
    var bookCover: some View {
        ZStack(alignment: .center) {
            if let data = viewModel.book.bookImageCover, let image = UIImage(data: data) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 170, height: 230)
                    .cornerRadius(8)
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 170, height: 230)
                    .cornerRadius(8)
            }

            PhotosPicker(selection: $viewModel.selectedItem, matching: .images) {
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(6)
            }
        }
        .onChange(of: viewModel.selectedItem) { _, newItem in
            viewModel.selectedItemChange(newItem)
        }
    }

    var descriptionField: some View {
        CustomTextEditor(title: Constants.descript, inputText: $viewModel.book.bookDescription)
    }
}

// MARK: - Constants

extension AddBookView {
    enum Constants {
        static let title = "Название"
        static let descript = "Описание"
        static let addBook = "Добавить книгу"
        static let author = "Автор"
        static let navigationTitle = "Добавить книгу"
        static let errorTitle = "Ошибка"
        static let errorButton = "ОК"
    }
}
