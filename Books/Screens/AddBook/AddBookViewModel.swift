//
//  AddBookViewModel.swift
//  Books
//
//  Created by Ксения Панкратова on 31.07.2025.
//

import Foundation
import _PhotosUI_SwiftUI

@Observable
final class AddBookViewModel: AddBookProtocol {
    var selectedItem: PhotosPickerItem?
    var book: AddBookModel = AddBookModel()
    var errorMessage: String?
    var showErrorMessage: Bool = false

    @ObservationIgnored
    private var coordinator: Coordinator?
    @ObservationIgnored
    private let manager: DataBaseManager
    @ObservationIgnored
    weak var delegate: BookCreationDelegate?

    init(manager: DataBaseManager = DataBaseManager.shared) {
        self.manager = manager
    }

    func setCoordinator(_ coordinator: Coordinator) {
        self.coordinator = coordinator
    }

    func addBook() {
        if validation() {
            do {
                try manager.createBook(
                    name: book.bookTitle,
                    author: book.author,
                    description: book.bookDescription,
                    cover: book.bookImageCover ?? Data()
                )

                delegate?.didCreateBook()
                coordinator?.openPreviousScreen()
            } catch {
                showErrorMessage = true
                errorMessage = "Не удалось сохранить книгу"
            }
        }
    }

    func selectedItemChange(_ newItem: PhotosPickerItem?) {
        guard let item = newItem else { return }
        Task {
            do {
                if let data = try await item.loadTransferable(type: Data.self) {
                    await MainActor.run {
                        self.book.bookImageCover = data
                    }
                }
            } catch {
                showErrorMessage = true
                errorMessage = "Не удалось загрузить изображение"
            }
        }
    }

    func validation() -> Bool {
        if book.bookTitle.isEmpty && book.author.isEmpty {
            return false
        } else {
            return true
        }
    }
}
