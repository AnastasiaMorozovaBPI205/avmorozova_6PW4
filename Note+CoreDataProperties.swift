//
//  Note+CoreDataProperties.swift
//  avmorozova_6PW4
//
//  Created by Anastasia on 19.10.2021.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var title: String?
    @NSManaged public var descriptionText: String?
    @NSManaged public var creationDate: Date

}

extension Note : Identifiable {

}
