//
//  MainInteractor.swift
//  WriteMe
//
//  Created by swiftment.work on 06/06/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import UIKit

class MainInteractor {

    private weak var viewer: MainPresenterViewer?
    private var dataSource: MainRepositoryDataSource!

    init(dataSource repository: MainRepositoryDataSource?) {
        self.dataSource = repository
    }

    deinit {
        print("deinit interactor")
    }

}

extension MainInteractor: MainInteractorDataSource {
    func setup(objectFor presenter: MainPresenterViewer) {
        self.viewer = presenter
    }
}
