//
//  DefaultNavigationController.swift
//  WriteMe
//
//  Created by Pets-y on 16.06.2021.
//  Copyright © 2021 Vladimir Mikhaylov. All rights reserved.
//

import UIKit
import RouteComposer

class BaseNavigationController: UINavigationController, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConfiguation()
        self.delegate = self
    }

    private func setupConfiguation() {
        navigationBar.prefersLargeTitles = true
    }
}
