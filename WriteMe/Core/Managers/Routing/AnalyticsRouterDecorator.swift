////
////  AnalyticsRouterDecorator.swift
////  ProjectVesta
////
////  Created by Tommy on 01.02.2021.
////
//
// import UIKit
// import RouteComposer
//
// struct AnalyticsRouterDecorator: Router {
//
//    let router: Router
//
//    init(router: Router) {
//        self.router = router
//    }
//
//    func navigate<ViewController: UIViewController, Context>(to step: DestinationStep<ViewController, Context>,
//                                                             with context: Context,
//                                                             animated: Bool = true,
//                                                             completion: ((RoutingResult) -> Void)? = nil) throws {
//        var sourceScreen: ScreenTypes?
//
//        if let topmostViewController = UIApplication.shared.keyWindow?.topmostViewController,
//            let viewController = try? UIViewController.findViewController(in: topmostViewController,
//                                                                          options: [.current, .visible],
//                                                                          using: { $0 is AnalyticsSupport }) as? AnalyticsSupport {
//            sourceScreen = viewController.screenType
//        }
//
//        try router.navigate(to: step, with: context, animated: animated) { result in
//            if let sourceScreen = sourceScreen {
//                Log.i("Source: \(sourceScreen)")
//                if let topmostViewController = UIApplication.shared.keyWindow?.topmostViewController,
//                    let analyticsViewController = try? UIViewController.findViewController(in: topmostViewController,
//                                                                                           options: [.current, .visible],
//                                                                                           using: { $0 is AnalyticsSupport }) as? AnalyticsSupport {
//                    Log.i("Target: \(analyticsViewController.screenType)")
//                }
//            }
//
//            completion?(result)
//
//        }
//    }
//
// }
