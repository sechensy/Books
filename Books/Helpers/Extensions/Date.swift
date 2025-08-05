//
//  Date.swift
//  Books
//
//  Created by Ксения Панкратова on 02.08.2025.
//

import Foundation

extension Date {
    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter.string(from: self)
    }
}
