//
//  MainPresener.swift
//  WriteMe
//
//  Created by Vladimir Mikhaylov on 27.08.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import Foundation
import InputMask

protocol PhoneInputPresentationLogic {
    func errorOpenApp(_ viewModel: PhoneInputModel.ToApp.Response)
    func errorPhoneInput()
    func loadSettings(_viewModel: PhoneInputModel.LoadSettings.Response)
}

class PhoneInputPresenter {
    
    weak var viewController: PhoneInputViewControllerProtocol?
    private var interactor: PhoneInputBusinessLogic
    var listener = MaskedTextFieldDelegate()
    
    init(interactor: PhoneInputBusinessLogic) {
        self.interactor = interactor
    }
    
    public func setup(settings: Settings) {
        if (viewController?.contentView.phoneInputView.phoneTextField.isFirstResponder ?? false) {
            viewController?.contentView.phoneInputView.phoneTextField.text = nil
        }
        if (settings.isRegionOn) {
            let regionPhoneCode = settings.region?.phoneCode ?? "+7"
            listener.primaryMaskFormat = "\(regionPhoneCode)[000000000000000000000000]"
            viewController?.contentView.phoneInputView.phoneTextField.keyboardType = .decimalPad
            viewController?.contentView.phoneInputView.phoneTextField.delegate = listener
        } else {
            viewController?.contentView.phoneInputView.phoneTextField.keyboardType = .default
            viewController?.contentView.phoneInputView.phoneTextField.delegate = nil
        }
    }
}

extension PhoneInputPresenter: PhoneInputPresentationLogic {
    func loadSettings(_viewModel: PhoneInputModel.LoadSettings.Response) {
        setup(settings: _viewModel.settings)
    }
    
    func errorPhoneInput() {
        if let view = viewController?.contentView.phoneInputView {
            Animation.share.shake(view: view)
        }
    }
    
    func errorOpenApp(_ viewModel: PhoneInputModel.ToApp.Response) {
        if let view = viewModel.sender {
            Animation.share.shake(view: view)
        }
    }
}
