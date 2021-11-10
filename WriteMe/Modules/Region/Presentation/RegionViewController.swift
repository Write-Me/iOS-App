//
//  RegionViewController.swift
//  WriteMe
//
//  Created by swiftment.work on 11/11/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import UIKit

class RegionViewController: UIViewController {

    private var dataSource: RegionPresenterDataSource?

    init(dataSource: RegionPresenterDataSource) {
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
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

    private func setupViews() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = "Регион"
    }

    private func setupConstraints() {
    }

    deinit {
        Log.t("deinit view")
    }

}

extension RegionViewController: RegionViewViewer {
}
