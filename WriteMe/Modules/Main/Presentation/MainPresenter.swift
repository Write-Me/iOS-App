//
//  MainPresenter.swift
//  WriteMe
//
//  Created by swiftment.work on 06/06/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import Foundation

class MainPresenter {

    private weak var viewer: MainViewViewer?
    private var dataSource: MainInteractorDataSource!
    
    private var settings: Settings
    private var viewModel: MainViewModel

    init(dataSource interactor: MainInteractorDataSource?) {
        dataSource = interactor
        settings = SettingsDefaultsDataStore.shared.get()
        viewModel = MainViewModel(settings)
    }

    deinit {
        print("deinit presenter")
    }

}

extension MainPresenter: MainPresenterDataSource {
    func openSettings() {
        MainRouter.settings(context: SettingsFactory.Context()).goto()
    }
    
    func phoneEntered(_ value: String?, type: SocialType) {
        guard checkPhoneNumber(phone: value) else {
            viewer?.errorPhoneInput()
            return
        }
        if let url = toAppUrl(value, type: type) {
            viewer?.openUrl(url)
        }
    }
    
    func setup(objectFor view: MainViewViewer) {
        self.viewer = view
        self.dataSource?.setup(objectFor: self)
        self.viewer?.fill(with: viewModel)
    }
}

extension MainPresenter: MainPresenterViewer {
}

extension MainPresenter {
    private func checkPhoneNumber(phone: String?) -> Bool {
        guard let phone = phone else { return false }
        if (phone.count == 0) {
            return false
        }
        return true
    }
    
    private func toAppUrl(_ phone: String?, type: SocialType) -> URL? {
        let url = "\(type.appUrl)\(phone ?? "")\(getTextMessage())"
        return URL(string: url.encodeUrl)
    }
    
    private func getTextMessage() -> String
    {
        var defaultText: String = ""
        if (settings.isDefaultTextOn) {
            defaultText += "&text=\(settings.defaultText ?? "")"
        }
        return defaultText
    }
}
