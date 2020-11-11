//
//  SettingsRouter.swift
//  WriteMe
//
//  Created by Vladimir Mikhaylov on 04.10.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import UIKit

@objc protocol SettingsRoutingLogic
{
  func routeToRegionSelector()
}

class SettingsRouter: NSObject, SettingsRoutingLogic {
    
    weak var viewController: SettingsViewController?
    
    func routeToRegionSelector() {
        let vc = RegionSelectorViewController()
        navigateToRegionSelector(source: viewController, destination: vc)
    }
    
    private func navigateToRegionSelector(source: SettingsViewController?, destination: RegionSelectorViewController) {
        destination.settingsViewController = source
        source?.navigationController?.pushViewController(destination, animated: true)
    }
    
    
    
}
