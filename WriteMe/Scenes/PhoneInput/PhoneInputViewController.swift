//
//  MainViewController.swift
//  WriteMe
//
//  Created by Vladimir Mikhaylov on 27.08.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import UIKit

protocol PhoneInputViewControllerProtocol: class {
    var contentView: PhoneInputView { get }
    func socialAppOpenError(_ viewModel: PhoneInputModel.ToApp.ViewModel)
}

class PhoneInputViewController: UIViewController {
    
    internal lazy var contentView = PhoneInputView()
    var interactor: PhoneInputBusinessLogic?
    var router: PhoneInputRoutingLogic?
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func setup() {
        let interactor = PhoneInputInteractor()
        let router = PhoneInputRouter()
        let presenter = PhoneInputPresenter(interactor: interactor)
        self.interactor = interactor
        self.router = router
        interactor.presenter = presenter
        presenter.viewController = self
        router.viewController = self
        setupView()
        setupTargets()
        setupData()
    }
    
    private func setupView() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = NSLocalizedString("EnterPhone", comment: "")
        let infoButton = SettingsButton()
        infoButton.addTarget(self, action: #selector(openInfo), for: .touchUpInside)
        let infoBarItem = UIBarButtonItem(customView: infoButton)
        infoBarItem.customView?.heightAnchor.constraint(equalToConstant: 30).isActive = true
        infoBarItem.customView?.widthAnchor.constraint(equalToConstant: 30).isActive = true
        navigationItem.rightBarButtonItem = infoBarItem
    }
    
    private func setupTargets() {
        contentView.whatsAppButton.addTarget(self, action: #selector(toApp(_:)), for: .touchUpInside)
        contentView.telegrammAppButton.addTarget(self, action: #selector(toApp(_:)), for: .touchUpInside)
    }
    
    public func setupData() {
        interactor?.loadSettings(_viewModel: PhoneInputModel.LoadSettings.Request())
    }
    
    @objc private func toApp(_ target: SocialButton) {
        Animation.share.pickAndPop(view: target)
        interactor?.toApp(PhoneInputModel.ToApp.Request(socialType: target.type, phone: contentView.phoneInputView.phoneTextField.text, sender: target))
    }
    
    @objc private func openInfo() {
        router?.routeToSettings()
    }
}

extension PhoneInputViewController: PhoneInputViewControllerProtocol {
    func socialAppOpenError(_ viewModel: PhoneInputModel.ToApp.ViewModel) {
    }
}
