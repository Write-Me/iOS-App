//
//  SettingsNewModels.swift
//  WriteMe
//
//  Created by swiftment.work on 11/06/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import Foundation

struct SettingsNewViewModel {
    let text: String

    init(_ model: SettingsNewModel) {
        self.text = model.content.text
    }
}

struct SettingsNewModel {
    var content: Content

    struct Content {
        var text: String

        init(_ content: SettingsNewResponseModel.Response) {
            self.text = content.text
        }

        mutating func logic() {
            self.text = text + " " + "bussiness logic"
        }
    }

    init(_ content: SettingsNewModel.Content) {
        self.content = content
    }
}

struct SettingsNewParametersModel: BackendRequest {
    var parameter: Int

    init(parameter: Int) {
        self.parameter = parameter
    }
}

struct SettingsNewResponseModel: BackendResponse {
    var isSuccess: Bool
    var error: BackendAPIError?
    let value: Response?

    struct Response: Decodable {
        let text: String
    }
}