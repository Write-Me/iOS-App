//
//  MainFactory.swift
//  WriteMe
//
//  Created by swiftment.work on 06/06/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import Foundation
import RouteComposer

class MainFactory: Factory {

    func build(with context: Context) throws -> MainViewController {
        #if MOCK
        let dataService = MainMockServices(.success)
        #else
        let dataService = MainNetworkServices()
        #endif
        let repository = MainRepository(dataSource: dataService)
        let interactor = MainInteractor(dataSource: repository)
        let presenter = MainPresenter(dataSource: interactor)
        return MainViewController(dataSource: presenter)
    }

    typealias ViewController = MainViewController
    typealias Context = Any?
}
