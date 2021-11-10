//
//  RegionPresenter.swift
//  WriteMe
//
//  Created by swiftment.work on 11/11/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import Foundation

class RegionPresenter {

    private weak var viewer: RegionViewViewer?
    private var dataSource: RegionInteractorDataSource!

    init(dataSource interactor: RegionInteractorDataSource?) {
        self.dataSource = interactor
    }

    deinit {
        print("deinit presenter")
    }

}

extension RegionPresenter: RegionPresenterDataSource {
    func setup(objectFor view: RegionViewViewer) {
        self.viewer = view
        self.dataSource?.setup(objectFor: self)
    }
}

extension RegionPresenter: RegionPresenterViewer {
}
