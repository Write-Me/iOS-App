//
//  UIViewController+Router.swift
//  ProjectVesta
//
//  Created by Tommy on 01.02.2021.
//

import os.log
import UIKit
import RouteComposer

extension UIViewController {

    static let defRouter: Router = {
        let appRouterLogger: DefaultLogger
        appRouterLogger = DefaultLogger(.verbose, osLog: OSLog(subsystem: Bundle.main.bundleIdentifier ?? "", category: "Router"))
        var defaultRouter = DefaultRouter(logger: appRouterLogger)
        defaultRouter.add(NavigationDelayingInterceptor(strategy: .wait, logger: appRouterLogger))
        return defaultRouter
//        return AnalyticsRouterDecorator(router: defaultRouter)
    }()

    var defRouter: Router {
        return UIViewController.defRouter
    }

}
