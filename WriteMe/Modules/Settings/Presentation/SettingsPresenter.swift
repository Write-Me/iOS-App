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

    init(dataSource interactor: SettingsInteractorDataSource?) {
        self.dataSource = interactor
    }

    deinit {
        print("deinit presenter")
    }
    
    private func getSections() {
        let settings = SettingsDefaultsDataStore.shared.get()
        let sectionOne: [SettingsViewModel] = [
            .region(CellWithNavigationModel(image: ImageKey.Settings.phone.rawValue, title: "Выбрать регион")),
            .regionSwitch(CellWithSwitchModel(image: ImageKey.Settings.region.rawValue, title: "Использовать регион", isOn: settings.isRegionOn))
        ]
        let sectionTwo: [SettingsViewModel] = [
            .defaultText(CellWithInputModel(image: ImageKey.Settings.chat.rawValue, value: settings.defaultText)),
            .defaultTextSwitch(CellWithSwitchModel(image: ImageKey.Settings.power.rawValue, title: "По умолчанию", isOn: settings.isDefaultTextOn))
        ]
        viewer?.showSections(model: [sectionOne, sectionTwo])
    }

}

extension SettingsPresenter: SettingsPresenterDataSource {
    func regionSwitch(_ isOn: Bool) {
        SettingsDefaultsDataStore.shared.save(setting: .isRegionOn, value: isOn)
    }
    
    func defaultValue(_ value: String?) {
        SettingsDefaultsDataStore.shared.save(setting: .defaultText, value: value)
    }
    
    func defaultSwitch(_ isOn: Bool) {
        SettingsDefaultsDataStore.shared.save(setting: .isDefaultTextOn, value: isOn)
    }
    
    func setup(objectFor view: SettingsViewViewer) {
        self.viewer = view
        self.dataSource?.setup(objectFor: self)
        getSections()
    }
}

extension SettingsPresenter: SettingsPresenterViewer {
}
