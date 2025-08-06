//
//  BookDescriptionSubviews.swift
//  Books
//
//  Created by Ксения Панкратова on 29.07.2025.
//

import Foundation
import SwiftUI

extension BookDescriptionView {

    var title: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(viewModel.book.name ?? "Нет")
                .font(.custom("Roboto-Semibold", size: 28))
            Text(viewModel.book.author ?? "Нет")
                .font(.custom("Roboto-Semibold", size: 18))
                .foregroundStyle(.buttonGray)
        }
    }

    var description: some View {
        VStack(alignment: .leading, spacing: 10) {
            Divider()
            Text(Constants.discript)
                .font(.custom("Roboto-Semibold", size: 16))
                .foregroundStyle(.text)
            Text(viewModel.book.bookDescription ?? "Нет")
                .font(.custom("Roboto-Light", size: 12))
                .foregroundStyle(.buttonGray)
        }
    }

    var notes: some View {
        VStack(alignment: .leading) {
            Text(Constants.notesTitle)
                .font(.custom("Roboto-Semibold", size: 16))
                .foregroundStyle(.text)
            ForEach(viewModel.book.notes?.allObjects as? [Note] ?? [], id: \.self) { note in
                BookNotesCard(date: note.date?.formattedDate() ?? "", text: note.text ?? "") {
                    viewModel.deleteNote(note: note)
                }
            }
            CustomTextField(title: Constants.addNote, inputText: $viewModel.addUserNote) {
                viewModel.addNote()
                viewModel.addUserNote = ""
            }
        }
    }

    var quotes: some View {
        VStack(alignment: .leading) {
            Text(Constants.quotesTitle)
                .font(.custom("Roboto-Semibold", size: 16))
                .foregroundStyle(.text)
            ForEach(viewModel.book.quotes?.allObjects as? [Quotes] ?? [], id: \.self) { quote in
                BookNotesCard(date: quote.date?.formattedDate() ?? "", text: quote.text ?? "") {
                    viewModel.deleteQuote(quote: quote)
                }
            }
            CustomTextField(title: Constants.addQuotes, inputText: $viewModel.addUserQoute) {
                viewModel.addQuote()
                viewModel.addUserQoute = ""
            }
        }
    }

    var deleteButton: some View {
        Button(action: {
            viewModel.deleteBook(book: viewModel.book)
            coordinator.openPreviousScreen()
        }) {
            Image(systemName: "trash.circle.fill")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundStyle(.red)
        }
        .frame(width: 24, height: 24)
    }
}

private extension BookDescriptionView {
    enum Constants {
        static let buttonTitle = "Читать"
        static let discript = "Описание"
        static let notesTitle = "Заметки по книге"
        static let quotesTitle = "Цитаты из книги"
        static let addNote = "Добавить заметку"
        static let addQuotes = "Добавить цитату"
    }
}
