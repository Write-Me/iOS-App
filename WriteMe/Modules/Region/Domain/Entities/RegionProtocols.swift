//
//  RegionProtocols.swift
//  WriteMe
//
//  Created by swiftment.work on 11/11/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import Foundation

protocol RegionViewViewer: AnyObject {
}

protocol RegionPresenterDataSource: AnyObject {
    func setup(objectFor view: RegionViewViewer)
}

protocol RegionPresenterViewer: AnyObject {
}

protocol RegionInteractorDataSource: AnyObject {
    func setup(objectFor presenter: RegionPresenterViewer)
}

protocol RegionInteractorViewer: AnyObject {
}

protocol RegionRepositoryDataSource: AnyObject {
}

protocol RegionServicesDataSource: AnyObject {
}

// MARK: Перечесления
/// Перечисление моковых json
/// - success: Положительный ответ
/// - empty: Список пуст
/// - error: Пришла ошибка
enum RegionJsonMockType {
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
        case .firstServiceName(let status): return "Region" + status.rawValue
        }
    }
}
