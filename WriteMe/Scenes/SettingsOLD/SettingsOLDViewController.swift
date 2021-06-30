//
//  InfoViewController.swift
//  WriteMe
//
//  Created by Vladimir on 10.09.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import UIKit

protocol SettingsOLDViewControllerProtocol: class
{
    var contentView: SettingsOLDView { get }
    func loadSettings(_ viewModel: SettingsOLDModel.ApplySettings.ViewModel)
}

class SettingsOLDViewController: UIViewController
{
    
    internal lazy var contentView: SettingsOLDView = {
        let view = SettingsOLDView()
        view.delegate = self
        return view
    }()
    public var interactor: SettingsOLDBusinessLogic?
    var router: (NSObjectProtocol & SettingsOLDRoutingLogic)?
    public var phoneInputViewController: PhoneInputViewController?
    
    override func loadView()
    {
        view = contentView
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        loadData()
    }
    
    private func setup()
    {
        let viewController = self
        let interactor = SettingsOLDInteractor()
        let router = SettingsOLDRouter()
        let presenter = SettingsOLDPresenter(interactor: interactor)
        self.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        viewController.router = router
        setupView()
    }
    
    private func setupView()
    {
        view.backgroundColor = UIColor(named: "background")
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = LocalizableKey.Settings.title.localized()
    }
    
    private func loadData()
    {
        interactor?.loadSettings(SettingsOLDModel.ApplySettings.Request())
    }
}

extension SettingsOLDViewController: SettingsOLDViewControllerProtocol
{
    func loadSettings(_ viewModel: SettingsOLDModel.ApplySettings.ViewModel) {
        contentView.setup(settings: viewModel.settings)
    }
    
}
 
