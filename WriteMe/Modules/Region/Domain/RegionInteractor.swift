//
//  RegionInteractor.swift
//  WriteMe
//
//  Created by swiftment.work on 11/11/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import UIKit

class RegionInteractor {

    private weak var viewer: RegionPresenterViewer?
    private var dataSource: RegionRepositoryDataSource!

    init(dataSource repository: RegionRepositoryDataSource?) {
        self.dataSource = repository
    }

    deinit {
        print("deinit interactor")
    }

}

extension RegionInteractor: RegionInteractorDataSource {
    func setup(objectFor presenter: RegionPresenterViewer) {
        self.viewer = presenter
    }
}
