//
//  RegionFactory.swift
//  WriteMe
//
//  Created by swiftment.work on 11/11/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import Foundation
import RouteComposer

class RegionFactory: Factory {

    func build(with context: Context) throws -> RegionViewController {
        #if MOCK
        let dataService = RegionMockServices(.success)
        #else
        let dataService = RegionNetworkServices()
        #endif
        let repository = RegionRepository(dataSource: dataService)
        let interactor = RegionInteractor(dataSource: repository)
        let presenter = RegionPresenter(dataSource: interactor)
        return RegionViewController(dataSource: presenter)
    }

    typealias ViewController = RegionViewController
    typealias Context = RegionContext
    struct RegionContext {
    }

}
