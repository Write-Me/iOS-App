//
//  testInteractor.swift
//  WriteMe
//
//  Created by swiftment.work on 04/06/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import UIKit

class testInteractor {

    private weak var viewer: testPresenterViewer?
    private var dataSource: testRepositoryDataSource!

    init(dataSource repository: testRepositoryDataSource?) {
        self.dataSource = repository
    }

    deinit {
        print("deinit interactor")
    }

}

extension testInteractor: testInteractorDataSource {
    func fetch(objectFor presenter: testPresenterViewer) {
        self.viewer = presenter
    }
}
