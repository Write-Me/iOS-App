//
//  SettingsWorker.swift
//  WriteMe
//
//  Created by Vladimir on 02.10.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import Foundation

enum SettingEnum: String
{
    case region = "region"
    case isRegionOn = "isRegionOn"
    case defaultText = "defaultText"
    case isDefaultTextOn = "isDefaultTextOn"
}

class SettingsWorker
{
    
    var settings: SettingsProtocol
    
    init(settings: SettingsProtocol)
    {
        self.settings = settings
    }
    
}

protocol SettingsProtocol
{
    func get() -> Settings
    func save(setting: SettingEnum, value: Any?)
    func getInt(setting: SettingEnum) -> Int
    func getBool(setting: SettingEnum) -> Bool
    func getString(setting: SettingEnum) -> String?
    func saveObject<T: Encodable>(t: T?.Type, setting: SettingEnum, value: T)
    func getObject<T: Decodable>(t: T.Type, setting: SettingEnum) -> T?
}
