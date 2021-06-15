//
//  MainViewController.swift
//  WriteMe
//
//  Created by swiftment.work on 06/06/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    private lazy var contentView = PhoneInputView()
    private var dataSource: MainPresenterDataSource?

    init(dataSource: MainPresenterDataSource) {
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
        setupView()
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
    }

    deinit {
        Log.t("deinit view")
    }
    
    private func setupView()
    {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = NSLocalizedString("EnterPhone", comment: "")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"),
                                                            style: .plain,
                                                            target: self ,
                                                            action: #selector(openInfo))
    }

}

extension MainViewController: MainViewViewer {
}

extension MainViewController {
    @objc private func openInfo() {
    }
}
