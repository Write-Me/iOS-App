//
//  RegionModels.swift
//  WriteMe
//
//  Created by swiftment.work on 11/11/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import Foundation

struct RegionViewModel {
    let text: String

    init(_ model: RegionModel) {
        self.text = model.content.text
    }
}

struct RegionModel {
    var content: Content

    struct Content {
        var text: String

        init(_ content: RegionResponseModel.Response) {
            self.text = content.text
        }

        mutating func logic() {
            self.text = text + " " + "bussiness logic"
        }
    }

    init(_ content: RegionModel.Content) {
        self.content = content
    }
}

struct RegionParametersModel: BackendRequest {
    var parameter: Int

    init(parameter: Int) {
        self.parameter = parameter
    }
}

struct RegionResponseModel: BackendResponse {
    var isSuccess: Bool
    var error: BackendAPIError?
    let value: Response?

    struct Response: Decodable {
        let text: String
    }
}
