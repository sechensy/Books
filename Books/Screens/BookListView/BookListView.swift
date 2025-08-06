//
//  BookListView.swift
//  Books
//
//  Created by Ксения Панкратова on 16.06.2025.
//

import Foundation
import SwiftUI

struct BookListView: View {
    @State private var coordinator = Coordinator()
    @Environment(StartScreenViewModel.self) private var startScreenViewModel
    @State var viewModel: BookListProtocol

    var body: some View {
        NavigationStack(path: $coordinator.navPath) {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(alignment: .leading, spacing: 20) {
                    ForEach(viewModel.books) { book in
                        CardView(book: book)
                            .onTapGesture {
                                viewModel.didTapBookScreen(book: book)
                            }
                    }
                }
            }
            .padding(.horizontal, 20)
            .toolbar {
                Button(action: {
                    viewModel.didTapAddBook()
                }) {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(.gray)
                }
            }
            .navigationDestination(for: BookListScreens.self) { screen in
                openNextScreen(for: screen)
                    .environment(coordinator)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(Constants.title)
        }
        .alert(Constants.errorText, isPresented: .constant(viewModel.errorMessage != nil), actions: {
            Button(Constants.errorButtonText) {
                viewModel.showErrorMessage = nil
            }
        }, message: {
            Text(viewModel.errorMessage ?? "")
        })
        .tint(.black)
        .onAppear {
            viewModel.setCoordinator(coordinator)
            viewModel.setStartScreenViewModel(startScreenViewModel)
        }
    }
}

private extension BookListView {
    @ViewBuilder
    func openNextScreen(for screen: BookListScreens) -> some View {
        switch screen {
        case let .description(book):
            BookDescriptionView(viewModel: {
                let vm = viewModel.configureDiscriptionViewModel(book: book)
                if let vm = vm as? BookDescriptionViewModel {
                    vm.deletionDelegate = viewModel as? BookDeletionDelegate
                }
                return vm
            }())
        case .addBook:
            AddBookView(viewModel: {
                let vm = AddBookViewModel()
                vm.delegate = viewModel as? BookCreationDelegate
                return vm
            }())
        }
    }
}

// MARK: - Constants

private extension BookListView {
    enum Constants {
        static let title = "Мои книги"
        static let errorText = "Ошибка"
        static let errorButtonText = "Ок"
    }
}
