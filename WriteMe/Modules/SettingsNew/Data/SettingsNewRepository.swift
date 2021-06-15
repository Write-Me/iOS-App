//
//  SettingsNewRepository.swift
//  WriteMe
//
//  Created by swiftment.work on 11/06/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import UIKit

class SettingsNewRepository {

    private var dataSource: SettingsNewServicesDataSource!

    init(dataSource services: SettingsNewServicesDataSource?) {
        self.dataSource = services
    }

    deinit {
        print("deinit repository")
    }

}

extension SettingsNewRepository: SettingsNewRepositoryDataSource {
}
