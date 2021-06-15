//
//  testPresenter.swift
//  WriteMe
//
//  Created by swiftment.work on 04/06/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import Foundation

class testPresenter {

    private weak var viewer: testViewViewer?
    private var dataSource: testInteractorDataSource!

    init(dataSource interactor: testInteractorDataSource?) {
        self.dataSource = interactor
    }

    private func mappingViewModel(_ model: testModel) -> testViewModel {

        return testViewModel(model)
    }

    deinit {
        print("deinit presenter")
    }

}

extension testPresenter: testPresenterDataSource {
    func fetch(objectFor view: testViewViewer) {
        self.viewer = view
        self.dataSource?.fetch(objectFor: self)
    }
}

extension testPresenter: testPresenterViewer {
}
