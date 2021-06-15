//
//  MainPresenter.swift
//  WriteMe
//
//  Created by swiftment.work on 06/06/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import Foundation

class MainPresenter {

    private weak var viewer: MainViewViewer?
    private var dataSource: MainInteractorDataSource!

    init(dataSource interactor: MainInteractorDataSource?) {
        self.dataSource = interactor
    }

    deinit {
        print("deinit presenter")
    }

}

extension MainPresenter: MainPresenterDataSource {
    func setup(objectFor view: MainViewViewer) {
        self.viewer = view
        self.dataSource?.setup(objectFor: self)
    }
}

extension MainPresenter: MainPresenterViewer {
}
