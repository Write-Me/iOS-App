//
//  MainProtocols.swift
//  WriteMe
//
//  Created by swiftment.work on 06/06/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import Foundation

protocol MainViewViewer: AnyObject {
}

protocol MainPresenterDataSource: AnyObject {
    func setup(objectFor view: MainViewViewer)
}

protocol MainPresenterViewer: AnyObject {
}

protocol MainInteractorDataSource: AnyObject {
    func setup(objectFor presenter: MainPresenterViewer)
}

protocol MainInteractorViewer: AnyObject {
}

protocol MainRepositoryDataSource: AnyObject {
}

protocol MainServicesDataSource: AnyObject {
}

// MARK: Перечесления
/// Перечисление моковых json
/// - success: Положительный ответ
/// - empty: Список пуст
/// - error: Пришла ошибка
enum MainJsonMockType {
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
        case .firstServiceName(let status): return "Main" + status.rawValue
        }
    }
}