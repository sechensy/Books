//
//  Note+CoreDataClass.swift
//  Books
//
//  Created by Ксения Панкратова on 23.06.2025.
//
//

import Foundation
import CoreData

@objc(Note)
public class Note: NSManagedObject {

}

extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var id: String?
    @NSManaged public var date: Date?
    @NSManaged public var text: String?
    @NSManaged public var book: Book?

}

extension Note : Identifiable {
    func deleteNote() {
        managedObjectContext?.delete(self)
        try? managedObjectContext?.save()
    }

    func updateNote(newText: String) {
        self.text = newText
        self.date = Date()

        try? managedObjectContext?.save()
    }
}
