//
//  RegionRepository.swift
//  WriteMe
//
//  Created by swiftment.work on 11/11/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import UIKit

class RegionRepository {

    private var dataSource: RegionServicesDataSource!

    init(dataSource services: RegionServicesDataSource?) {
        self.dataSource = services
    }

    deinit {
        print("deinit repository")
    }

}

extension RegionRepository: RegionRepositoryDataSource {
}
