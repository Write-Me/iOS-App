//
//  RegionListProtocols.swift
//  WriteMe
//
//  Created by swiftment.work on 11/11/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import Foundation

protocol RegionListViewViewer: AnyObject {
}

protocol RegionListPresenterDataSource: AnyObject {
    func setup(objectFor view: RegionListViewViewer)
    func navigateToRegion()
}

protocol RegionListPresenterViewer: AnyObject {
    func response(_ regions: [Region])
}

protocol RegionListInteractorDataSource: AnyObject {
    func setup(objectFor presenter: RegionListPresenterViewer)
    func fetchRegions()
}

protocol RegionListInteractorViewer: AnyObject {
}

protocol RegionListRepositoryDataSource: AnyObject {
}

protocol RegionListServicesDataSource: AnyObject {
}

// MARK: Перечесления
/// Перечисление моковых json
/// - success: Положительный ответ
/// - empty: Список пуст
/// - error: Пришла ошибка
enum RegionListJsonMockType {
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
        case .firstServiceName(let status): return "RegionList" + status.rawValue
        }
    }
}
