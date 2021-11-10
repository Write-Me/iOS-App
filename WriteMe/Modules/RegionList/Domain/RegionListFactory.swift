//
//  RegionListFactory.swift
//  WriteMe
//
//  Created by swiftment.work on 11/11/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import Foundation
import RouteComposer

class RegionListFactory: Factory {

    func build(with context: Context) throws -> RegionListViewController {
        #if MOCK
        let dataService = RegionListMockServices(.success)
        #else
        let dataService = RegionListNetworkServices()
        #endif
        let repository = RegionListRepository(dataSource: dataService)
        let interactor = RegionListInteractor(dataSource: repository)
        let presenter = RegionListPresenter(dataSource: interactor)
        return RegionListViewController(dataSource: presenter)
    }

    typealias ViewController = RegionListViewController
    typealias Context = RegionListContext
    struct RegionListContext {
    }

}
