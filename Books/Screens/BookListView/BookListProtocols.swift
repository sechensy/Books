//
//  BookListProtocols.swift
//  Books
//
//  Created by Ксения Панкратова on 16.06.2025.
//

import Foundation

protocol BookListProtocol {
    var books: [Book] { get set }
    var errorMessage: String? { get set }

    func setCoordinator(_ coordinator: Coordinator)
    func setStartScreenViewModel(_ startScreenViewModel: StartScreenViewModel)
    func didTapBookScreen(book: Book)
    func didTapAddBook()
    func fetchBooks()
    func configureDiscriptionViewModel(book: Book) -> BookDescriptionProtocols
}

protocol BookCreationDelegate: AnyObject {
    func didCreateBook()
}

protocol BookDeletionDelegate: AnyObject {
    func didDeleteBook()
}
