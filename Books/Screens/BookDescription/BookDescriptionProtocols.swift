//
//  BookDescriptionProtocols.swift
//  Books
//
//  Created by Ксения Панкратова on 29.07.2025.
//

import Foundation

protocol BookDescriptionProtocols {
    var addUserNote: String { get set }
    var addUserQoute: String { get set }
    var book: Book { get set }
    var errorMessage: String? { get set }
    var showAlert: Bool { get set }

    func addNote()
    func addQuote()
    func deleteNote(note: Note)
    func deleteQuote(quote: Quotes)
    func deleteBook(book: Book)
}
