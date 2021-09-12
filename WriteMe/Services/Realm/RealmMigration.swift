//
//  RealmMigration.swift
//  WriteMe
//
//  Created by Vladimir on 12.11.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import RealmSwift

class RealmMigration {
    
    static let share = RealmMigration()
    
    public func migration() {
        self.deleteAll()
        Realm.Configuration.defaultConfiguration = Realm.Configuration(
            schemaVersion: 3,
            migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < 1) {
                    
                }
        })
        let _ = try! Realm()
    }
    
    public func deleteAll() {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
    }
}
