//
//  RegionListPresenter.swift
//  WriteMe
//
//  Created by swiftment.work on 11/11/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import Foundation

class RegionListPresenter {

    private weak var viewer: RegionListViewViewer?
    private var dataSource: RegionListInteractorDataSource!

    init(dataSource interactor: RegionListInteractorDataSource?) {
        self.dataSource = interactor
    }

    deinit {
        print("deinit presenter")
    }

}

extension RegionListPresenter: RegionListPresenterDataSource {
    func navigateToRegion() {
        MainRouter.region(context: RegionFactory.Context()).goto()
    }

    func setup(objectFor view: RegionListViewViewer) {
        self.viewer = view
        self.dataSource?.setup(objectFor: self)
    }
}

extension RegionListPresenter: RegionListPresenterViewer {
    func response(_ regions: [Region]) {
    }

}
