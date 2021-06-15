//
//  Log.swift
//  WriteMe
//
//  Created by Pets-y on 04.06.2021.
//  Copyright © 2021 Vladimir Mikhaylov. All rights reserved.
//

import Foundation

final class Log {

    static var info = true
    static var test = true
    static var error = true
    static var allOff = false

    static func i(_ content: Any? = "", tag: String = "DEFAULT") {
        if Log.info && !Log.allOff {
            print("ℹ️(Information)", "[", tag, "]", content ?? "", "\n")
        }
    }

    static func t(_ content: Any? = "", tag: String = "DEFAULT") {
        if Log.test && !Log.allOff {
            print("🛠(Testing)", "[", tag, "]", content ?? "", "\n")
        }
    }

    static func e(_ content: Any? = "", tag: String = "DEFAULT") {
        if Log.error && !Log.allOff {
            print("⛔️(Error)", "[", tag, "]", content ?? "", "\n")
        }
    }

    static func w(_ content: Any? = "", tag: String = "DEFAULT") {
        if Log.info && !Log.allOff {
            print("⚠️(Warning)", "[", tag, "]", content ?? "", "\n")
        }
    }

}
