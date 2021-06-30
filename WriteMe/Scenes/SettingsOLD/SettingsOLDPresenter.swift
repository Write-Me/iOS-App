//
//  SettingsPresenter.swift
//  WriteMe
//
//  Created by Vladimir on 02.10.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import Foundation

protocol SettingsOLDPresentationLogic {
    func loadSettings(_ viewModel: SettingsOLDModel.ApplySettings.Response)
    func switchIsRegionOn(_ viewModel: SettingsOLDModel.ToggleIsRegionOn.Response)
}

class SettingsOLDPresenter {
    
    weak var viewController: SettingsOLDViewControllerProtocol?
    private var interactor: SettingsOLDBusinessLogic
    
    init(interactor: SettingsOLDBusinessLogic) {
        self.interactor = interactor
    }
    
}

extension SettingsOLDPresenter: SettingsOLDPresentationLogic {
    
    func loadSettings(_ viewModel: SettingsOLDModel.ApplySettings.Response) {
        viewController?.loadSettings(SettingsOLDModel.ApplySettings.ViewModel(settings: viewModel.settings))
    }
    
    func switchIsRegionOn(_ viewModel: SettingsOLDModel.ToggleIsRegionOn.Response) {
    }
    
}
