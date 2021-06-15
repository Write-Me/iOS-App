//
//  SettingsNewViewController.swift
//  WriteMe
//
//  Created by swiftment.work on 11/06/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import UIKit

class SettingsNewViewController: UIViewController {

    private var dataSource: SettingsNewPresenterDataSource?

    init(dataSource: SettingsNewPresenterDataSource) {
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource?.setup(objectFor: self)
        self.view.backgroundColor = .green
    }

    deinit {
        Log.t("deinit view")
    }

}

extension SettingsNewViewController: SettingsNewViewViewer {
}
