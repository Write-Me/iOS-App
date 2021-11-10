//
//  MainViewController.swift
//  WriteMe
//
//  Created by swiftment.work on 06/06/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import UIKit
import InputMask

protocol MainViewDelegate: AnyObject {
    func settingsUpdated()
}

class MainViewController: FlexibleScrollViewController {

    lazy var phoneInputView: InputView = {
        let view = InputView(effect: UIBlurEffect(style: .systemMaterial))
        return view
    }()

    lazy var whatsAppButton: SocialButton = {
        let view = SocialButton()
        view.type = .whatsapp
        return view
    }()

    lazy var telegrammAppButton: SocialButton = {
        let view = SocialButton()
        view.type = .telegram
        return view
    }()

    lazy var contentVStack: UIStackView = {
        $0.distribution = .fillProportionally
        $0.axis = .vertical
        $0.spacing = 16
        return $0
    }(UIStackView(arrangedSubviews: [phoneInputView, whatsAppButton]))

    private var dataSource: MainPresenterDataSource?
    var listener = MaskedTextFieldDelegate()

    init(dataSource: MainPresenterDataSource) {
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
        setupView()
        setupTargets()
        uiTestSetup()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        self.dataSource?.setup(objectFor: self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Log.t("viewWillAppear")
        if phoneInputView.inputTextField.isFirstResponder ?? false {
            phoneInputView.inputTextField.text = nil
        }
    }

    private func setupViews() {
        view.backgroundColor = .systemBackground
        contentView.addSubviews(contentVStack)
    }

    private func setupConstraints() {
        contentVStack.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().inset(16)
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
        whatsAppButton.addTarget(self, action: #selector(phoneEntered), for: .touchUpInside)
    }

    private func uiTestSetup() {
        phoneInputView.inputTextField.accessibilityId = .mainScreenPhoneInput
        whatsAppButton.accessibilityId = .mainScreenWButton
        navigationItem.rightBarButtonItem?.accessibilityId = .mainScreenSettingsButton
    }

}

extension MainViewController: MainViewViewer {
    func openUrl(_ url: URL) {
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        } else {
            Animation.share.shake(view: phoneInputView)
        }
    }

    func fill(with viewModel: MainViewModel) {
        let content = UIPasteboard.general.string
        Log.t(content)
        if viewModel.needApplyMask {
            listener.primaryMaskFormat = viewModel.inputMask ?? ""
            phoneInputView.inputTextField.keyboardType = .decimalPad
            phoneInputView.inputTextField.delegate = listener
        } else {
            phoneInputView.inputTextField.keyboardType = .default
            phoneInputView.inputTextField.delegate = nil
        }
    }

    func errorPhoneInput() {
        Animation.share.shake(view: phoneInputView)
    }
}

extension MainViewController {
    @objc private func settingsClicked() {
        dataSource?.openSettings(delegate: self)
    }

    @objc private func phoneEntered(_ target: SocialButton) {
        dataSource?.phoneEntered(phoneInputView.inputTextField.text, type: .whatsapp)
    }
}

extension MainViewController: MainViewDelegate {
    func settingsUpdated() {
        dataSource?.reloadData()
    }
 }
