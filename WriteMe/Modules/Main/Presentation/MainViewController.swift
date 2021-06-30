//
//  MainViewController.swift
//  WriteMe
//
//  Created by swiftment.work on 06/06/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import UIKit
import InputMask

class MainViewController: UIViewController {

    private lazy var contentView = PhoneInputView()
    private var dataSource: MainPresenterDataSource?
    var listener = MaskedTextFieldDelegate()

    init(dataSource: MainPresenterDataSource) {
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
        setupView()
        setupTargets()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func loadView() {
        view = contentView
    }

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource?.setup(objectFor: self)
        self.view.backgroundColor = .white
        navigationController?.presentationController?.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if (contentView.phoneInputView.inputTextField.isFirstResponder ?? false) {
            contentView.phoneInputView.inputTextField.text = nil
        }
    }

    deinit {
        Log.t("deinit view")
    }
    
    private func setupView() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = NSLocalizedString("EnterPhone", comment: "")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"),
                                                            style: .plain,
                                                            target: self ,
                                                            action: #selector(settingsClicked))
    }
    
    private func setupTargets() {
        contentView.whatsAppButton.addTarget(self, action: #selector(phoneEntered), for: .touchUpInside)
    }

}

extension MainViewController: MainViewViewer {
    func openUrl(_ url: URL) {
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        } else {
            Animation.share.shake(view: contentView.phoneInputView)
        }
    }
    
    func fill(with viewModel: MainViewModel) {
        if (viewModel.needApplyMask) {
            listener.primaryMaskFormat = viewModel.inputMask ?? ""
            contentView.phoneInputView.inputTextField.keyboardType = .decimalPad
            contentView.phoneInputView.inputTextField.delegate = listener
        } else {
            contentView.phoneInputView.inputTextField.keyboardType = .default
            contentView.phoneInputView.inputTextField.delegate = nil
        }
    }
    
    func errorPhoneInput() {
        Animation.share.shake(view: contentView.phoneInputView)
    }
}

extension MainViewController {
    @objc private func settingsClicked() {
        dataSource?.openSettings()
    }
    
    @objc private func settingsClickedTwo() {
        let x = SettingsOLDViewController()
        present(x, animated: true, completion: nil)
    }
    
    @objc private func phoneEntered(_ target: SocialButton) {
        dataSource?.phoneEntered(contentView.phoneInputView.inputTextField.text, type: .whatsapp)
    }
}

extension MainViewController: UIAdaptivePresentationControllerDelegate
{
    func presentationControllerWillDismiss(_ presentationController: UIPresentationController) {
        viewWillAppear(true)
    }
}

