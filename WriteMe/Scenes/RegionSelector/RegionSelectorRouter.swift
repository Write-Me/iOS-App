//
//  RegionSelectorRouter.swift
//  WriteMe
//
//  Created by Vladimir Mikhaylov on 03.10.2020.
//  Copyright (c) 2020 Vladimir Mikhaylov. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol RegionSelectorRoutingLogic
{
    func routeSettings()
}

protocol RegionSelectorDataPassing
{
    var dataStore: RegionSelectorDataStore? { get }
}

class RegionSelectorRouter: NSObject, RegionSelectorRoutingLogic, RegionSelectorDataPassing
{
    
    weak var viewController: RegionSelectorViewController?
    var dataStore: RegionSelectorDataStore?
    
    // MARK: Routing
    
    func routeSettings()
    {
        passDataToSettings()
        navigateToSettings()
    }
    
    // MARK: Navigation
    
    private func passDataToSettings()
    {
        viewController?.settingsViewController?.interactor?.loadSettings(SettingsModel.ApplySettings.Request())
    }
    
    private func navigateToSettings()
    {
        viewController?.navigationController?.popViewController(animated: true)
    }
}