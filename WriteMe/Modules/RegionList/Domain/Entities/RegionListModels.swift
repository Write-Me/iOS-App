//
//  RegionListModels.swift
//  WriteMe
//
//  Created by swiftment.work on 11/11/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import Foundation

struct RegionListViewModel {
    let text: String

    init(_ model: RegionListModel) {
        self.text = model.content.text
    }
}

struct RegionListModel {
    var content: Content

    struct Content {
        var text: String

        init(_ content: RegionListResponseModel.Response) {
            self.text = content.text
        }

        mutating func logic() {
            self.text = text + " " + "bussiness logic"
        }
    }

    init(_ content: RegionListModel.Content) {
        self.content = content
    }
}

struct RegionListParametersModel: BackendRequest {
    var parameter: Int

    init(parameter: Int) {
        self.parameter = parameter
    }
}

struct RegionListResponseModel: BackendResponse {
    var isSuccess: Bool
    var error: BackendAPIError?
    let value: Response?

    struct Response: Decodable {
        let text: String
    }
}
