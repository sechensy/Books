//
//  Some.swift
//  BooksTests
//
//  Created by Ксения Панкратова on 29.09.2025.
//

import XCTest
@testable import Books

final class Some: XCTestCase {
    var viewModel: AddBookViewModel!

    override func setUp() {
        super.setUp()
        viewModel = AddBookViewModel(manager: DataBaseManager.shared)
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testValidationWhenAllEmpty() {
            viewModel.book = AddBookModel(bookTitle: "", bookDescription: "", author: "", bookImageCover: nil)

            XCTAssertFalse(viewModel.validation())
        }

        func testValidationWhenOnlyTitleFilled() {
            viewModel.book = AddBookModel(bookTitle: "Название", bookDescription: "", author: "", bookImageCover: nil)

            XCTAssertTrue(viewModel.validation())
        }

        func testValidationWhenOnlyAuthorFilled() {
            viewModel.book = AddBookModel(bookTitle: "", bookDescription: "", author: "Автор", bookImageCover: nil)

            XCTAssertTrue(viewModel.validation())
        }

        func testValidationWhenTitleAndAuthorFilled() {
            viewModel.book = AddBookModel(bookTitle: "Название", bookDescription: "Описание", author: "Автор", bookImageCover: nil)

            XCTAssertTrue(viewModel.validation())
        }
}
