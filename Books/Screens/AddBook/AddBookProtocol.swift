//
//  AddBookProtocol.swift
//  Books
//
//  Created by Ксения Панкратова on 31.07.2025.
//

import Foundation
import _PhotosUI_SwiftUI

protocol AddBookProtocol {
    var book: AddBookModel { get set }
    var selectedItem: PhotosPickerItem? { get set }
    var errorMessage: String? { get set }
    var showErrorMessage: Bool { get set }

    func addBook()
    func setCoordinator(_ coordinator: Coordinator)
    func selectedItemChange(_ newItem: PhotosPickerItem?)
    func validation() -> Bool
}
