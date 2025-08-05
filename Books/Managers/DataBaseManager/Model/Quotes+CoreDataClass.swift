//
//  Quotes+CoreDataClass.swift
//  Books
//
//  Created by Ксения Панкратова on 23.06.2025.
//
//

import Foundation
import CoreData

@objc(Quotes)
public class Quotes: NSManagedObject {

}

extension Quotes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Quotes> {
        return NSFetchRequest<Quotes>(entityName: "Quotes")
    }

    @NSManaged public var id: String?
    @NSManaged public var text: String?
    @NSManaged public var date: Date?
    @NSManaged public var book: Book?

}

extension Quotes : Identifiable {
    func deleteQuotes() {
        managedObjectContext?.delete(self)
        try? managedObjectContext?.save()
    }

    func updateQuote(newText: String) {
        self.text = newText
        self.date = Date()

        try? managedObjectContext?.save()
    }
}
