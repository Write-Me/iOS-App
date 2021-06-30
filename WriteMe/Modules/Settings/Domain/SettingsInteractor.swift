//
//  SettingsNewInteractor.swift
//  WriteMe
//
//  Created by swiftment.work on 11/06/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import UIKit

class SettingsNewInteractor {

    private weak var viewer: SettingsPresenterViewer?
    private var dataSource: SettingsRepositoryDataSource!

    init(dataSource repository: SettingsRepositoryDataSource?) {
        self.dataSource = repository
    }

    deinit {
        print("deinit interactor")
    }

}

extension SettingsNewInteractor: SettingsInteractorDataSource {
    func setup(objectFor presenter: SettingsPresenterViewer) {
        self.viewer = presenter
    }
}
