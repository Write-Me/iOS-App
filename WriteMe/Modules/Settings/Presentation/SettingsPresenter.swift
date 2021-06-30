//
//  SettingsNewPresenter.swift
//  WriteMe
//
//  Created by swiftment.work on 11/06/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import Foundation

class SettingsPresenter {

    private weak var viewer: SettingsViewViewer?
    private var dataSource: SettingsInteractorDataSource!
    private var settings: Settings

    init(dataSource interactor: SettingsInteractorDataSource?) {
        self.dataSource = interactor
        self.settings = SettingsDefaultsDataStore.shared.get()
    }

    deinit {
        print("deinit presenter")
    }
    
    private func getSections() {
        let sectionOne: [SettingsViewModel] = [
            .region(CellWithNavigationModel(image: "", title: "")),
            .region(CellWithNavigationModel(image: "", title: ""))
        ]
        let sectionTwo: [SettingsViewModel] = [
            .region(CellWithNavigationModel(image: "", title: "")),
        ]
        let sectionThree: [SettingsViewModel] = [
            .region(CellWithNavigationModel(image: "", title: "")),
            .region(CellWithNavigationModel(image: "", title: "")),
            .region(CellWithNavigationModel(image: "", title: ""))
        ]
        viewer?.showSections(model: [sectionOne, sectionTwo, sectionThree])
    }

}

extension SettingsPresenter: SettingsPresenterDataSource {
    func setup(objectFor view: SettingsViewViewer) {
        self.viewer = view
        self.dataSource?.setup(objectFor: self)
        getSections()
    }
}

extension SettingsPresenter: SettingsPresenterViewer {
}
