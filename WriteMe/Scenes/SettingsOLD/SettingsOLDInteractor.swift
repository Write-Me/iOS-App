//
//  SettingsInteractor.swift
//  WriteMe
//
//  Created by Vladimir on 02.10.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import Foundation

protocol SettingsOLDBusinessLogic {
    func loadSettings(_ viewModel: SettingsOLDModel.ApplySettings.Request)
    func switchIsRegionOn(_ viewModel: SettingsOLDModel.ToggleIsRegionOn.Request)
    func setDefaultText(_ viewModel: SettingsOLDModel.SetDefaultText.Request)
    func toggleIsDefaultTextOn(_ viewModel: SettingsOLDModel.ToggleIsDefaultTextOn.Request)
}

class SettingsOLDInteractor {

    var presenter: SettingsOLDPresentationLogic?

}

extension SettingsOLDInteractor: SettingsOLDBusinessLogic {

    func loadSettings(_ viewModel: SettingsOLDModel.ApplySettings.Request) {
        presenter?.loadSettings(SettingsOLDModel.ApplySettings.Response(settings: SettingsDefaultsDataStore.shared.get()))
    }

    func switchIsRegionOn(_ viewModel: SettingsOLDModel.ToggleIsRegionOn.Request) {
        SettingsDefaultsDataStore.shared.save(setting: .isRegionOn, value: !SettingsDefaultsDataStore.shared.getBool(setting: .isRegionOn))
    }

    func toggleIsDefaultTextOn(_ viewModel: SettingsOLDModel.ToggleIsDefaultTextOn.Request) {
        SettingsDefaultsDataStore.shared.save(setting: .isDefaultTextOn, value: !SettingsDefaultsDataStore.shared.getBool(setting: .isDefaultTextOn))
    }

    func setDefaultText(_ viewModel: SettingsOLDModel.SetDefaultText.Request) {
        SettingsDefaultsDataStore.shared.save(setting: .defaultText, value: viewModel.value)
    }

}
