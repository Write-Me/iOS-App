//
//  RegionListInteractor.swift
//  WriteMe
//
//  Created by swiftment.work on 11/11/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import UIKit

class RegionListInteractor {

    private weak var viewer: RegionListPresenterViewer?
    private var dataSource: RegionListRepositoryDataSource!

    init(dataSource repository: RegionListRepositoryDataSource?) {
        self.dataSource = repository
    }

    deinit {
        print("deinit interactor")
    }

}

extension RegionListInteractor: RegionListInteractorDataSource {
    func fetchRegions() {
    }

    func setup(objectFor presenter: RegionListPresenterViewer) {
        self.viewer = presenter
    }
}
