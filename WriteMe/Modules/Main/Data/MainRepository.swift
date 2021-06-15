//
//  MainRepository.swift
//  WriteMe
//
//  Created by swiftment.work on 06/06/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import UIKit

class MainRepository {

    private var dataSource: MainServicesDataSource!

    init(dataSource services: MainServicesDataSource?) {
        self.dataSource = services
    }

    deinit {
        print("deinit repository")
    }

}

extension MainRepository: MainRepositoryDataSource {
}
