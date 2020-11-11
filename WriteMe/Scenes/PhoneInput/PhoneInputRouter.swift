//
//  PhoneInputRouter.swift
//  WriteMe
//
//  Created by Vladimir on 10.09.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import UIKit

protocol PhoneInputRoutingLogic {
  func routeToSettings()
}

class PhoneInputRouter {
    
    weak var viewController: PhoneInputViewController?
    
    private func navigateToSettings(source: PhoneInputViewController?, destination: UINavigationController) {
        source?.present(destination, animated: true, completion: nil)
    }
}

extension PhoneInputRouter: PhoneInputRoutingLogic {
    func routeToSettings() {
        let nc = UINavigationController()
        let vc = SettingsViewController()
        vc.phoneInputViewController = viewController
        nc.viewControllers = [vc]
        navigateToSettings(source: viewController, destination: nc)
    }
}

