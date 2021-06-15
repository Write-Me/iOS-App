//
//  MainModels.swift
//  WriteMe
//
//  Created by swiftment.work on 06/06/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import Foundation

struct MainViewModel {
    let text: String

    init(_ model: MainModel) {
        self.text = model.content.text
    }
}

struct MainModel {
    var content: Content

    struct Content {
        var text: String

        init(_ content: MainResponseModel.Response) {
            self.text = content.text
        }

        mutating func logic() {
            self.text = text + " " + "bussiness logic"
        }
    }

    init(_ content: MainModel.Content) {
        self.content = content
    }
}

struct MainParametersModel: BackendRequest {
    var parameter: Int

    init(parameter: Int) {
        self.parameter = parameter
    }
}

struct MainResponseModel: BackendResponse {
    var isSuccess: Bool
    var error: BackendAPIError?
    let value: Response?

    struct Response: Decodable {
        let text: String
    }
}