//
//  SettingsNewProtocols.swift
//  WriteMe
//
//  Created by swiftment.work on 11/06/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import Foundation

protocol SettingsViewViewer: AnyObject {
    func showSections(model: [[SettingsViewModel]])
}

protocol SettingsPresenterDataSource: AnyObject {
    func setup(objectFor view: SettingsViewViewer)
    func regionSwitch(_ isOn: Bool)
    func defaultValue(_ value: String?)
    func defaultSwitch(_ isOn: Bool)
}

protocol SettingsPresenterViewer: AnyObject {
}

protocol SettingsInteractorDataSource: AnyObject {
    func setup(objectFor presenter: SettingsPresenterViewer)
}

protocol SettingsInteractorViewer: AnyObject {
}

protocol SettingsRepositoryDataSource: AnyObject {
}

protocol SettingsServicesDataSource: AnyObject {
}

// MARK: Перечесления
/// Перечисление моковых json
/// - success: Положительный ответ
/// - empty: Список пуст
/// - error: Пришла ошибка
enum SettingsNewJsonMockType {
    case firstServiceName(StatusType)

    enum StatusType: String {
        case success = "Success"
        case empty = "Empty"
        case error = "Error"
    }

    /// Метод для получения названия json файла
    ///
    /// - Returns: Название ввиде текста
    func getNameFile() -> String {
        switch self {
        case .firstServiceName(let status): return "SettingsNew" + status.rawValue
        }
    }
}
