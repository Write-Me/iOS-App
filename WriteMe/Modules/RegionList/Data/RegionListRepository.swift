//
//  RegionListRepository.swift
//  WriteMe
//
//  Created by swiftment.work on 11/11/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import UIKit

class RegionListRepository {

    private var dataSource: RegionListServicesDataSource!

    init(dataSource services: RegionListServicesDataSource?) {
        self.dataSource = services
    }

    deinit {
        print("deinit repository")
    }

}

extension RegionListRepository: RegionListRepositoryDataSource {
}
