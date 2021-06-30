//
//  SettingsNewRepository.swift
//  WriteMe
//
//  Created by swiftment.work on 11/06/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import UIKit

class SettingsRepository {

    private var dataSource: SettingsServicesDataSource!

    init(dataSource services: SettingsServicesDataSource?) {
        self.dataSource = services
    }

    deinit {
        print("deinit repository")
    }

}

extension SettingsRepository: SettingsRepositoryDataSource {
}
