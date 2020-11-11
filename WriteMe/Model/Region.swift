//
//  Region.swift
//  WriteMe
//
//  Created by Vladimir on 07.10.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import Foundation
import RealmSwift

//struct Region: Codable {
//    var name: String
//    var phoneCode: String
//    var imageUrl: String?
//}

class Region: Object, Codable {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var phoneCode = ""
    @objc dynamic var imageUrl: String? = nil
    
    override static func primaryKey() -> String?
    {
        return "id"
    }
}
