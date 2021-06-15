//
//  SettingsNewInteractor.swift
//  WriteMe
//
//  Created by swiftment.work on 11/06/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import UIKit

class SettingsNewInteractor {

    private weak var viewer: SettingsNewPresenterViewer?
    private var dataSource: SettingsNewRepositoryDataSource!

    init(dataSource repository: SettingsNewRepositoryDataSource?) {
        self.dataSource = repository
    }

    deinit {
        print("deinit interactor")
    }

}

extension SettingsNewInteractor: SettingsNewInteractorDataSource {
    func setup(objectFor presenter: SettingsNewPresenterViewer) {
        self.viewer = presenter
    }
}
