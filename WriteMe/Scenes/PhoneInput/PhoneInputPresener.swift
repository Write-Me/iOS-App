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
    var listener = MaskedTextFieldDelegate()

    public func setup(settings: Settings) {
        if viewController?.contentView.phoneInputView.inputTextField.isFirstResponder ?? false {
            viewController?.contentView.phoneInputView.inputTextField.text = nil
        }
        if settings.isRegionOn {
            let regionPhoneCode = settings.region?.phoneCode ?? "+7"
            listener.primaryMaskFormat = "\(regionPhoneCode)[000000000000000000000000]"
            viewController?.contentView.phoneInputView.inputTextField.keyboardType = .decimalPad
            viewController?.contentView.phoneInputView.inputTextField.delegate = listener
        } else {
            viewController?.contentView.phoneInputView.inputTextField.keyboardType = .default
            viewController?.contentView.phoneInputView.inputTextField.delegate = nil
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
