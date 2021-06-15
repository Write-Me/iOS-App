//
//  ScreenConfigurator.swift
//  WriteMe
//
//  Created by Pets-y on 04.06.2021.
//  Copyright © 2021 Vladimir Mikhaylov. All rights reserved.
//

import Foundation
import RouteComposer
import UIKit

protocol ScreenConfigurator {
    var main: DestinationStep<MainViewController, Any?> { get }
}

extension ScreenConfigurator {
    var main: DestinationStep<MainViewController, MainFactory.Context> {
        return StepAssembly(
            finder: ClassFinder<MainViewController, MainFactory.Context>(options: .currentAllStack),
            factory: MainFactory()
        )
        .using(BaseNavigationController.push())
        .from(DefaultConfigurator.baseNavigationController(context: MainFactory.Context.self, options: .allVisible, presentationStyle: .fullScreen))
        .assemble()
    }
    
    var test: DestinationStep<SettingsNewViewController, SettingsNewFactory.Context> {
        return StepAssembly(
            finder: ClassFinder<SettingsNewViewController, SettingsNewFactory.Context>(options: .current, startingPoint: .root),
            factory: SettingsNewFactory()
        )
        .using(GeneralAction.replaceRoot())
        .from(GeneralStep.root())
        .assemble()
    }
    
    
    
}

struct DefaultConfigurator: ScreenConfigurator {

    static func baseNavigationController<T>(context: T.Type, options: SearchOptions, presentationStyle: UIModalPresentationStyle?) -> DestinationStep<BaseNavigationController, T> {
            return SwitchAssembly<BaseNavigationController, T>()
                .addCase(expecting: ClassFinder<BaseNavigationController, T>(options: options))
                .assemble(default: {
                    return  ChainAssembly
                            .from(
                                SingleContainerStep(
                                    finder: NilFinder(),
                                    factory: NavigationControllerFactory<BaseNavigationController, T>()
                                )
                            )
                            .using(
                                GeneralAction.presentModally(
                                    presentationStyle: presentationStyle,
                                    isModalInPresentation: false)
                            )
                            .from(GeneralStep.current())
                            .assemble()
                })
        }
}

class ConfiguratorHolder {
     static var configuration: ScreenConfigurator = DefaultConfigurator()
}
