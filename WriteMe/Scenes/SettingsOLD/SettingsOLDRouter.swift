//
//  SettingsRouter.swift
//  WriteMe
//
//  Created by Vladimir Mikhaylov on 04.10.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import UIKit

@objc protocol SettingsOLDRoutingLogic
{
    func routeToRegionSelector()    
}

class SettingsOLDRouter: NSObject, SettingsOLDRoutingLogic {
    
    weak var viewController: SettingsOLDViewController?
    
    func routeToRegionSelector() {
        let vc = RegionSelectorViewController()
        navigateToRegionSelector(source: viewController, destination: vc)
    }
    
    private func navigateToRegionSelector(source: SettingsOLDViewController?, destination: RegionSelectorViewController) {
        destination.settingsViewController = source
        source?.navigationController?.pushViewController(destination, animated: true)
    }
    
    
    
}
