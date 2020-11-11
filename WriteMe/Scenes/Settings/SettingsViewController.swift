//
//  InfoViewController.swift
//  WriteMe
//
//  Created by Vladimir on 10.09.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import UIKit

protocol SettingsViewControllerProtocol: class {
    var contentView: SettingsView { get }
    func loadSettings(_ viewModel: SettingsModel.ApplySettings.ViewModel)
}

class SettingsViewController: UIViewController {
    
    internal lazy var contentView: SettingsView = {
        let view = SettingsView()
        view.delegate = self
        return view
    }()
    public var interactor: SettingsBusinessLogic?
    var router: (NSObjectProtocol & SettingsRoutingLogic)?
    public var phoneInputViewController: PhoneInputViewController?
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        loadData()
        setupView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        phoneInputViewController?.setupData()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(named: "background")
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = NSLocalizedString("Settings", comment: "")
    }
    
    private func setup() {
        let viewController = self
        let interactor = SettingsInteractor()
        let router = SettingsRouter()
        let presenter = SettingsPresenter(interactor: interactor)
        self.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        viewController.router = router
    }
    
    private func loadData() {
        interactor?.loadSettings(SettingsModel.ApplySettings.Request())
    }
}

extension SettingsViewController: SettingsViewControllerProtocol {
    func loadSettings(_ viewModel: SettingsModel.ApplySettings.ViewModel) {
        contentView.setup(settings: viewModel.settings)
    }
    
}
 
