//
//  testEntities.swift
//  WriteMe
//
//  Created by swiftment.work on 04/06/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import Foundation

// MARK: Протоколы
protocol testViewViewer: AnyObject {
}

protocol testPresenterDataSource: AnyObject {
    func fetch(objectFor view: testViewViewer)
}

protocol testPresenterViewer: AnyObject {
}

protocol testInteractorDataSource: AnyObject {
    func fetch(objectFor presenter: testPresenterViewer)
}

protocol testInteractorViewer: AnyObject {
}

protocol testRepositoryDataSource: AnyObject {
}

protocol testServicesDataSource: AnyObject {
}

// MARK: Перечесления
/// Перечисление моковых json
/// - success: Положительный ответ
/// - empty: Список пуст
/// - error: Пришла ошибка
enum testJsonMockType {
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
        case .firstServiceName(let status): return "test" + status.rawValue
        }
    }
}

// MARK: Структуры
struct testViewModel {
    let text: String

    init(_ model: testModel) {
        self.text = model.content.text
    }
}

struct testModel {
    var content: Content

    struct Content {
        var text: String

        init(_ content: testResponseModel.Response) {
            self.text = content.text
        }

        mutating func logic() {
            self.text = text + " " + "bussiness logic"
        }
    }

    init(_ content: testModel.Content) {
        self.content = content
    }
}

struct testParametersModel {
    var parameter: Int

    init(parameter: Int) {
        self.parameter = parameter
    }
}

struct testResponseModel {
    var isSuccess: Bool
//    var error: BackendAPIError?
    let value: Response?

    struct Response: Decodable {
        let text: String
    }
}
