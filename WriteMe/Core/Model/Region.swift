//
//  Region.swift
//  WriteMe
//
//  Created by Vladimir on 07.10.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import Foundation
import RealmSwift

class Region: Object, Codable {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var name = ""
    @objc dynamic var phoneCode = ""
    @objc dynamic var imageUrl: String?

    override static func primaryKey() -> String? {
        return "id"
    }
}
