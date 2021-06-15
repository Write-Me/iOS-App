//
//  SettingsNewFactory.swift
//  WriteMe
//
//  Created by swiftment.work on 11/06/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import Foundation
import RouteComposer

class SettingsNewFactory: Factory {

    func build(with context: Context) throws -> SettingsNewViewController {
        #if MOCK
        let dataService = SettingsNewMockServices(.success)
        #else
        let dataService = SettingsNewNetworkServices()
        #endif
        let repository = SettingsNewRepository(dataSource: dataService)
        let interactor = SettingsNewInteractor(dataSource: repository)
        let presenter = SettingsNewPresenter(dataSource: interactor)
        return SettingsNewViewController(dataSource: presenter)
    }

    typealias ViewController = SettingsNewViewController
    typealias Context = Any?
    struct SettingsNewContext {
    }

}
