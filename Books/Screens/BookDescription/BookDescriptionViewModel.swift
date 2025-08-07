//
//  BookDescriptionViewModel.swift
//  Books
//
//  Created by Ксения Панкратова on 29.07.2025.
//

import Foundation

@Observable
final class BookDescriptionViewModel: BookDescriptionProtocols {
    var addUserNote: String = ""
    var addUserQoute: String = ""
    var book: Book
    var errorMessage: String?
    var showAlert = false

    @ObservationIgnored
    var manager: DataBaseManager
    @ObservationIgnored
    weak var deletionDelegate: BookDeletionDelegate?

    init(book: Book, manager: DataBaseManager = DataBaseManager.shared) {
        self.book = book
        self.manager = manager
    }

    func addNote() {
        do {
            try manager.addNote(book: book, noteText: addUserNote)
        } catch {
            showAlert = true
            errorMessage = "Не удалось сохранить заметку"
        }
    }
    
    func addQuote() {
        do {
           try manager.addQuotes(book: book, quotesText: addUserQoute)
        } catch {
            showAlert = true
            errorMessage = "Не удалось сохранить цитату"
        }
    }

    func deleteNote(note: Note) {
        do {
            try manager.deleteNote(note)
        } catch {
            showAlert = true
            errorMessage = "Не удалось удалить заметку"
        }
    }

    func deleteQuote(quote: Quotes) {
        do {
            try manager.deleteQuote(quote)
        } catch {
            showAlert = true
            errorMessage = "Не удалось удалить цитату"
        }
    }

    func deleteBook(book: Book) {
        do {
            try manager.deleteBook(book)
            deletionDelegate?.didDeleteBook()
        } catch {
            showAlert = true
            errorMessage = "Не удалось удалить книгу"
        }
    }
}
