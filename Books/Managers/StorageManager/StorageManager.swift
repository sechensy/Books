//
//  StorageManager.swift
//  Books
//
//  Created by Ксения Панкратова on 23.06.2025.
//

import Foundation

class StorageManager {
    private var path = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask)[0]

    //MARK: Save cover
    /// `saveCover` метод для сохранения обложки
    ///  `cover.jpeg` стандартное название обложки
    func saveCover(bookId: String, cover: Data) {
        let bookPath = path.appending(component: bookId)
        try? FileManager.default.createDirectory(at: bookPath, withIntermediateDirectories: true)
        let coverPath = bookPath.appending(component: "cover.jpeg")

        do {
            try cover.write(to: coverPath)
        } catch {
            print(error.localizedDescription)
        }
    }

    /// `getCover` метод для получения файла
    func getCover(bookId: String) -> Data? {
        let coverPath = path
            .appending(component: bookId)
            .appending(component: "cover.jpeg")
        do {
            let coverData = try Data(contentsOf: coverPath)
            return coverData
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
