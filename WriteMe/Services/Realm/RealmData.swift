//
//  RealmDataService.swift
//  WriteMe
//
//  Created by Vladimir on 11.11.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import RealmSwift

class RealmData<T: Object>: RealmObjectProtocol {

    func save<T>(object: T) -> T where T: Object {
        let realm = try! Realm()
        try! realm.write {
            realm.add(object, update: .all)
        }
        return object
    }

    func save<T>(objects: [T]) -> [T] where T: Object {
        let realm = try! Realm()
        try! realm.write {
            realm.add(objects, update: .all)
        }
        return all()
    }

    func all<T>() -> [T] where T: Object {
        let realm = try! Realm()
        return Array(realm.objects(T.self))
    }

    func all<T>() -> Results<T> where T: Object {
        let realm = try! Realm()
        return realm.objects(T.self)
    }

    func delete<T>(object: T) where T: Object {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(object)
        }
    }

    func deleteAll<T>(_ object: T.Type) where T: Object {
        let realm = try! Realm()
        let objects = realm.objects(T.self)
        try! realm.write {
            realm.delete(objects)
        }
    }
}

protocol RealmObjectProtocol {
    func save<T: Object>(object: T) -> T
    func save<T: Object>(objects: [T]) -> [T]
    func all<T: Object>() -> [T]
    func all<T: Object>() -> Results<T>
    func delete<T: Object>(object: T)
    func deleteAll<T: Object>(_ object: T.Type)
}
