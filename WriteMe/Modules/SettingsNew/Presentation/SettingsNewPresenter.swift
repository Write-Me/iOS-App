//
//  SettingsNewPresenter.swift
//  WriteMe
//
//  Created by swiftment.work on 11/06/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import Foundation

class SettingsNewPresenter {

    private weak var viewer: SettingsNewViewViewer?
    private var dataSource: SettingsNewInteractorDataSource!

    init(dataSource interactor: SettingsNewInteractorDataSource?) {
        self.dataSource = interactor
    }

    deinit {
        print("deinit presenter")
    }

}

extension SettingsNewPresenter: SettingsNewPresenterDataSource {
    func setup(objectFor view: SettingsNewViewViewer) {
        self.viewer = view
        self.dataSource?.setup(objectFor: self)
    }
}

extension SettingsNewPresenter: SettingsNewPresenterViewer {
}
