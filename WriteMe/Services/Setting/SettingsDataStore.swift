//
//  SettingsDataStore.swift
//  WriteMe
//
//  Created by Vladimir on 02.10.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import Foundation

class SettingsDataStore: SettingsProtocol {

    static public let shared = SettingsDataStore()
    
    func get() -> Settings {
        return Settings(region: getObject(t: Region.self, setting: .region),
                        isRegionOn: getBool(setting: .isRegionOn),
                        defaultText: getString(setting: .defaultText),
                        isDefaultTextOn: getBool(setting: .isDefaultTextOn)
        )
    }
    
    func save(setting: SettingEnum, value: Any?) {
        UserDefaults.standard.set(value, forKey: setting.rawValue)
    }
    
    func saveObject<T: Encodable>(t: T?.Type, setting: SettingEnum, value: T) {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(value), forKey: setting.rawValue)
    }
    
    func getInt(setting: SettingEnum) -> Int {
        return UserDefaults.standard.integer(forKey: setting.rawValue)
    }
    
    func getBool(setting: SettingEnum) -> Bool {
        return UserDefaults.standard.bool(forKey: setting.rawValue)
    }
    
    func getString(setting: SettingEnum) -> String? {
        return UserDefaults.standard.string(forKey: setting.rawValue)
    }
    
    func getObject<T: Decodable>(t: T.Type, setting: SettingEnum) -> T? {
        if let data = UserDefaults.standard.value(forKey: setting.rawValue) as? Data {
            return try? PropertyListDecoder().decode(T?.self, from: data)
        }
        return nil
    }
}
