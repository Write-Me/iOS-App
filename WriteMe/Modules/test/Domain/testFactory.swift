//
//  testFactory.swift
//  WriteMe
//
//  Created by swiftment.work on 04/06/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import Foundation
import RouteComposer

class testFactory: Factory {

    func build(with context: Context) throws -> testViewController {
        #if MOCK
        let dataService = testMockServices(.success)
        #else
        let dataService = testNetworkServices()
        #endif
        let repository = testRepository(dataSource: dataService)
        let interactor = testInteractor(dataSource: repository)
        let presenter = testPresenter(dataSource: interactor)
        return testViewController(dataSource: presenter)
    }

    typealias ViewController = testViewController
    typealias Context = testContext
    struct testContext {
    }

}
