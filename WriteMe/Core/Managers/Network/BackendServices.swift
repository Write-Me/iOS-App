//
//  BackendServices.swift
//  WriteMe
//
//  Created by Pets-y on 06.06.2021.
//  Copyright © 2021 Vladimir Mikhaylov. All rights reserved.
//

import Foundation

protocol BackendRequest: Encodable { }

protocol BackendResponse: Decodable {
    associatedtype APIError: APIErrorProtocol = BackendAPIError
    var error: APIError? { get }
}

protocol APIErrorProtocol: Decodable {
    var type: String { get }
    var message: String { get }
    var code: Int? { get }
}

protocol APIErrorWithDataProtocol: APIErrorProtocol {
    associatedtype APIErrorData: Decodable
    var data: APIErrorData { get }
}

struct BackendAPIError: APIErrorProtocol {
    var type: String
    var message: String
    var code: Int?
}
