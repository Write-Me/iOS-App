//
//  SettingsNewFactory.swift
//  WriteMe
//
//  Created by swiftment.work on 11/06/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import Foundation
import RouteComposer

class SettingsFactory: Factory {

    func build(with context: Context) throws -> SettingsViewController {
        #if MOCK
        let dataService = SettingsMockServices(.success)
        #else
        let dataService = SettingsNetworkServices()
        #endif
        let repository = SettingsRepository(dataSource: dataService)
        let interactor = SettingsNewInteractor(dataSource: repository)
        let presenter = SettingsPresenter(dataSource: interactor)
        return SettingsViewController(dataSource: presenter)
    }

    typealias ViewController = SettingsViewController
    typealias Context = SettingsContext
    struct SettingsContext {
    }

}
