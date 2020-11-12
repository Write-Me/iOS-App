//
//  RegionAddViewController.swift
//  WriteMe
//
//  Created by Vladimir on 13.11.2020.
//  Copyright (c) 2020 Vladimir Mikhaylov. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol RegionAddDisplayLogic: class
{
    func displaySomething(viewModel: RegionAdd.Something.ViewModel)
}

class RegionAddViewController: UIViewController, RegionAddDisplayLogic
{
    internal lazy var contentView = RegionAddView()
    var interactor: RegionAddBusinessLogic?
    var router: (NSObjectProtocol & RegionAddRoutingLogic & RegionAddDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup()
    {
        let viewController = self
        let interactor = RegionAddInteractor()
        let presenter = RegionAddPresenter()
        let router = RegionAddRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        setupView()
    }
    
    private func setupView()
    {
        view.backgroundColor = UIColor(named: "background")
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = NSLocalizedString("RegionAdd", comment: "")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: NSLocalizedString("Save", comment: ""),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(navigateToRegionsSelector))
    }
    
    // MARK: View lifecycle
    
    override func loadView()
    {
        view = contentView
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        doSomething()
    }
    
    func doSomething()
    {
    }
    
    func displaySomething(viewModel: RegionAdd.Something.ViewModel)
    {
        //nameTextField.text = viewModel.name
    }
    
    @objc private func navigateToRegionsSelector()
    {
        router?.routeToRegionsSelector()
    }
}