//
//  LocalizableKey.swift
//  WriteMe
//
//  Created by Vladimir Mikhaylov on 23.05.2021.
//  Copyright © 2021 Vladimir Mikhaylov. All rights reserved.
//

import Foundation
typealias LocalizeKey = String

enum LocalizableKey {
    enum Settings: LocalizeKey {
        case title = "settings_title"
        case regionTitle = "settings_region_title"
    }
}

extension RawRepresentable where RawValue == LocalizeKey {
    func localized() -> String {
        return rawValue.localized()
    }
}

extension String {

    public func localized() -> String {
        return self.localized(bundle: Bundle.main)
    }

    public func localized(bundle: Bundle) -> String {
        return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
    }
}
