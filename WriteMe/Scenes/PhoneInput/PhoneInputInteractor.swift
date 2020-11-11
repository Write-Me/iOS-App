//
//  MainInteractor.swift
//  WriteMe
//
//  Created by Vladimir Mikhaylov on 27.08.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import UIKit

protocol PhoneInputBusinessLogic {
    func toApp(_ viewModel: PhoneInputModel.ToApp.Request)
    func loadSettings(_viewModel: PhoneInputModel.LoadSettings.Request)
}

protocol PhoneInputInteractorDelegate {
}

class PhoneInputInteractor {
    
    var presenter: PhoneInputPresentationLogic?
    
    private func checkPhoneNumber(phone: String?) -> Bool {
        guard let phone = phone else { return false }
        if (phone.count == 0) {
            return false
        }
        return true
    }

}

extension PhoneInputInteractor: PhoneInputBusinessLogic {

    
    func toApp(_ viewModel: PhoneInputModel.ToApp.Request) {
        if (!checkPhoneNumber(phone: viewModel.phone)) {
            presenter?.errorPhoneInput()
        } else
        if let url = toAppUrl(viewModel) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            } else {
                presenter?.errorOpenApp(PhoneInputModel.ToApp.Response(socialType: viewModel.socialType, sender: viewModel.sender))
            }
        }
    }
    
    private func toAppUrl(_ viewModel: PhoneInputModel.ToApp.Request) -> URL? {
        let url = "\(viewModel.socialType.appUrl)\(viewModel.phone ?? "")\(getTextMessage())"
        return URL(string: url.encodeUrl)
    }
    
    private func getTextMessage() -> String
    {
        var defaultText: String = ""
        let settings = SettingsDataStore.shared.get()
        if (settings.isDefaultTextOn)
        {
            defaultText += "&text=\(settings.defaultText ?? "")"
        }
        return defaultText
    }
    
    func loadSettings(_viewModel: PhoneInputModel.LoadSettings.Request) {
        presenter?.loadSettings(_viewModel: PhoneInputModel.LoadSettings.Response(settings: SettingsDataStore.shared.get()))
    }
}
