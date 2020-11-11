//
//  SettingsPresenter.swift
//  WriteMe
//
//  Created by Vladimir on 02.10.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import Foundation

protocol SettingsPresentationLogic {
    func loadSettings(_ viewModel: SettingsModel.ApplySettings.Response)
    func switchIsRegionOn(_ viewModel: SettingsModel.ToggleIsRegionOn.Response)
}

class SettingsPresenter {
    
    weak var viewController: SettingsViewControllerProtocol?
    private var interactor: SettingsBusinessLogic
    
    init(interactor: SettingsBusinessLogic) {
        self.interactor = interactor
    }
    
}

extension SettingsPresenter: SettingsPresentationLogic {
    
    func loadSettings(_ viewModel: SettingsModel.ApplySettings.Response) {
        viewController?.loadSettings(SettingsModel.ApplySettings.ViewModel(settings: viewModel.settings))
    }
    
    func switchIsRegionOn(_ viewModel: SettingsModel.ToggleIsRegionOn.Response) {
    }
    
}
