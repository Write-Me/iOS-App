//
//  MainRouter.swift
//  WriteMe
//
//  Created by Pets-y on 06.06.2021.
//  Copyright © 2021 Vladimir Mikhaylov. All rights reserved.
//

import UIKit

enum MainRouter {
    case main(context: MainFactory.Context)
    case settings(context: SettingsFactory.Context)
    case test(context: SettingsFactory.Context)
}

extension MainRouter {
    func goto() {
        switch self {
        case .main(let context):
            try? UIViewController.defRouter.navigate(to: ConfiguratorHolder.configuration.main,
                                                  with: context, animated: true, completion: nil)
        case .settings(let context):
            try? UIViewController.defRouter.navigate(to: ConfiguratorHolder.configuration.settings,
                                                  with: context, animated: true, completion: nil)
        case .test(let context):
            try? UIViewController.defRouter.navigate(to: ConfiguratorHolder.configuration.test,
                                                  with: context, animated: true, completion: nil)
        }
    }
}
