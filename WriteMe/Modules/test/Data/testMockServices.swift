//
//  testMockServices.swift
//  WriteMe
//
//  Created by swiftment.work on 04/06/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

class testMockServices: testServicesDataSource {

    var mockFile: testJsonMockType

    init(_ mockFile: testJsonMockType) {
        self.mockFile = mockFile
    }

}
