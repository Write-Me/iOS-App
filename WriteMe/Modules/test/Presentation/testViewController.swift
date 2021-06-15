//
//  testViewController.swift
//  WriteMe
//
//  Created by swiftment.work on 04/06/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import UIKit

class testViewController: UIViewController {

    private var dataSource: testPresenterDataSource?

    init(dataSource: testPresenterDataSource) {
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource?.fetch(objectFor: self)
        self.view.backgroundColor = .white
    }

    deinit {
        Log.t("deinit view")
    }

}

extension testViewController: testViewViewer {
}
