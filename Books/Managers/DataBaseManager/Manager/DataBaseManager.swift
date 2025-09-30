//
//  DataBaseManager.swift
//  Books
//
//  Created by Ксения Панкратова on 23.06.2025.
//

import Foundation
import CoreData

final class DataBaseManager {
    static let shared = DataBaseManager()
    private init() {}

    var books: [Book] = []

    //MARK: Container
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "db")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

extension DataBaseManager {
    //MARK: Book

    /// `createBook` - метод для сохранения одной книги
    ///  *name* название книги
    ///  *author* имя автора
    ///  *description* описание книги
    ///  *cover* обложка книги
    func createBook(name: String, author: String, description: String, cover: Data) throws {
        let bookId = UUID().uuidString
        let _ : Book = {
            $0.id = bookId
            $0.name = name
            $0.author = author
            $0.status = BookStatus.reading.rawValue
            $0.coverURL = cover
            $0.bookDescription = description
            $0.date = Date()
            return $0
        }(Book(context: self.persistentContainer.viewContext))

        self.saveContext()
        try self.fetchBooks()
    }

    /// `deleteBook` - метод для удаления книги
    func deleteBook(_ book: Book) throws {
        let context = persistentContainer.viewContext
        context.delete(book)

        try context.save()
        try fetchBooks()
    }

    /// `fetchBooks` - метод для получения всех книг
    func fetchBooks() throws {
        let request = Book.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: true)]

        let books = try persistentContainer.viewContext.fetch(request)
        self.books = books
    }
}

extension DataBaseManager {

    //MARK: Note
    func addNote(book: Book, noteText: String) throws {
        let context = persistentContainer.viewContext

        let _ : Note = {
            $0.id = UUID().uuidString
            $0.date = Date()
            $0.book = book
            $0.text = noteText
            return $0
        }(Note(context: context))

        try context.save()
        context.refresh(book, mergeChanges: true)
    }

    func deleteNote(_ note: Note) throws {
        let context = persistentContainer.viewContext
        let book = note.book
        context.delete(note)

        try context.save()
        if let book = book {
            context.refresh(book, mergeChanges: true)
        }
    }

    //MARK: Quotes
    func addQuotes(book: Book, quotesText: String) throws {
        let context = persistentContainer.viewContext

        let _ : Quotes = {
            $0.id = UUID().uuidString
            $0.date = Date()
            $0.book = book
            $0.text = quotesText
            return $0
        }(Quotes(context: context))

        try context.save()
        context.refresh(book, mergeChanges: true)
    }

    func deleteQuote(_ quote: Quotes) throws {
        let context = persistentContainer.viewContext
        context.delete(quote)

        try context.save()
    }
}
