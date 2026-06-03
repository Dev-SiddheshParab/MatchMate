//
//  CoreDataManager.swift
//  MatchMate
//
//  Created by Siddhesh Parab on 02/06/26.
//

import Foundation
import CoreData

final class CoreDataManager {

    static let shared = CoreDataManager()

    private init() {}

    lazy var persistentContainer: NSPersistentContainer = {

        let container =
        NSPersistentContainer(name: "MatchMateDB")
        container.viewContext.mergePolicy =
        NSMergeByPropertyObjectTrumpMergePolicy
        container.loadPersistentStores { _, error in

            if let error = error {

                fatalError(error.localizedDescription)
            }
        }

        return container
    }()

    var context: NSManagedObjectContext {

        persistentContainer.viewContext
    }

    // MARK: - Save Context

    func saveContext() {

        if context.hasChanges {

            do {

                try context.save()

            } catch {

                print(error.localizedDescription)
            }
        }
    }
}
