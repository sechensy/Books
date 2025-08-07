//
//  BookListViewModel.swift
//  Books
//
//  Created by Ксения Панкратова on 16.06.2025.
//

import Foundation

@Observable
final class BookListViewModel: BookListProtocol {
    var books: [Book] = []
    var errorMessage: String? = nil
    var showAlert = false

    @ObservationIgnored
    private var coordinator: Coordinator?
    @ObservationIgnored
    private var startScreenViewModel: StartScreenViewModel?
    @ObservationIgnored
    private let manager: DataBaseManager

    init(manager: DataBaseManager = DataBaseManager.shared) {
        self.manager = manager
        fetchBooks()
    }

    func setCoordinator(_ coordinator: Coordinator) {
        self.coordinator = coordinator
    }

    func setStartScreenViewModel(_ startScreenViewModel: StartScreenViewModel) {
        self.startScreenViewModel = startScreenViewModel
    }

    func didTapBookScreen(book: Book) {
        coordinator?.addScreen(screen: BookListScreens.description(book))
    }

    func didTapAddBook() {
        coordinator?.addScreen(screen: BookListScreens.addBook)
    }

    func fetchBooks() {
        do {
            try manager.fetchBooks()
            self.books = manager.books
        } catch {
            errorMessage = "Не удалось загрузить книги"
        }
    }

    func configureDiscriptionViewModel(book: Book) -> BookDescriptionProtocols {
        let viewModel = BookDescriptionViewModel(book: book)
        return viewModel
    }
}

extension BookListViewModel: BookCreationDelegate {
    func didCreateBook() {
        fetchBooks()
    }
}

extension BookListViewModel: BookDeletionDelegate {
    func didDeleteBook() {
        fetchBooks()
    }
}
