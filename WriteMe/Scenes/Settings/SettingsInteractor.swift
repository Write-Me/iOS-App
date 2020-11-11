//
//  SettingsInteractor.swift
//  WriteMe
//
//  Created by Vladimir on 02.10.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import Foundation

protocol SettingsBusinessLogic
{
    func loadSettings(_ viewModel: SettingsModel.ApplySettings.Request)
    func switchIsRegionOn(_ viewModel: SettingsModel.ToggleIsRegionOn.Request)
    func setDefaultText(_ viewModel: SettingsModel.SetDefaultText.Request)
    func toggleIsDefaultTextOn(_ viewModel: SettingsModel.ToggleIsDefaultTextOn.Request)
}

class SettingsInteractor
{
    
    var presenter: SettingsPresentationLogic?
    
}

extension SettingsInteractor: SettingsBusinessLogic
{

    func loadSettings(_ viewModel: SettingsModel.ApplySettings.Request)
    {
        presenter?.loadSettings(SettingsModel.ApplySettings.Response(settings: SettingsDefaultsDataStore.shared.get()))
    }
    
    func switchIsRegionOn(_ viewModel: SettingsModel.ToggleIsRegionOn.Request)
    {
        SettingsDefaultsDataStore.shared.save(setting: .isRegionOn, value: !SettingsDefaultsDataStore.shared.getBool(setting: .isRegionOn))
    }
    
    func toggleIsDefaultTextOn(_ viewModel: SettingsModel.ToggleIsDefaultTextOn.Request)
    {
        SettingsDefaultsDataStore.shared.save(setting: .isDefaultTextOn, value: !SettingsDefaultsDataStore.shared.getBool(setting: .isDefaultTextOn))
    }
    
    func setDefaultText(_ viewModel: SettingsModel.SetDefaultText.Request)
    {
        SettingsDefaultsDataStore.shared.save(setting: .defaultText, value: viewModel.value)
    }
    
    
    
}
