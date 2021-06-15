//
//  testRepository.swift
//  WriteMe
//
//  Created by swiftment.work on 04/06/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import UIKit

class testRepository {

    private var dataSource: testServicesDataSource!

    init(dataSource services: testServicesDataSource?) {
        self.dataSource = services
    }

    deinit {
        print("deinit repository")
    }

}

extension testRepository: testRepositoryDataSource {
}
