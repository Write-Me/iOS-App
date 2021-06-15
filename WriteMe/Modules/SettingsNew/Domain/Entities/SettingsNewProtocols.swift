//
//  SettingsNewProtocols.swift
//  WriteMe
//
//  Created by swiftment.work on 11/06/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import Foundation

protocol SettingsNewViewViewer: AnyObject {
}

protocol SettingsNewPresenterDataSource: AnyObject {
    func setup(objectFor view: SettingsNewViewViewer)
}

protocol SettingsNewPresenterViewer: AnyObject {
}

protocol SettingsNewInteractorDataSource: AnyObject {
    func setup(objectFor presenter: SettingsNewPresenterViewer)
}

protocol SettingsNewInteractorViewer: AnyObject {
}

protocol SettingsNewRepositoryDataSource: AnyObject {
}

protocol SettingsNewServicesDataSource: AnyObject {
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