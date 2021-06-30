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
        .from(DefaultConfigurator.buildBaseNavigationController(context: MainFactory.Context.self, options: .allVisible, presentationStyle: .fullScreen))
        .assemble()
    }
    
    var settings: DestinationStep<SettingsViewController, SettingsFactory.Context> {
        return DefaultConfigurator.buildOnNavigationController(with: SettingsFactory(), options: .contained)
    }
    
}

struct DefaultConfigurator: ScreenConfigurator {
    
    /// Использовать, когда хотим положить VC поверх VestaNavigationController
    static func buildOnNavigationController<F: Factory>(with factory: F, options: SearchOptions = .allVisible) -> DestinationStep<F.ViewController, F.Context> {
        return StepAssembly(
            finder: ClassFinder<F.ViewController, F.Context>(options: .current, startingPoint: .root),
            factory: factory
        )
        .using(BaseNavigationController.push())
        .from(buildBaseNavigationController(context: F.Context.self, options: options))
        .assemble()
    }
    
    /// Использовать, когда хотим построить VestaNavigationController с context
    static func buildBaseNavigationController<С>(context: С.Type,
                                                  options: SearchOptions = .allVisible,
                                                  presentationStyle: UIModalPresentationStyle? = .pageSheet) -> DestinationStep<BaseNavigationController, С> {
        return SwitchAssembly<BaseNavigationController, С>()
            .addCase(expecting: ClassFinder<BaseNavigationController, С>(options: options))
            .assemble(default: {
                return  ChainAssembly
                    .from(
                        SingleContainerStep(
                            finder: NilFinder(),
                            factory: NavigationControllerFactory<BaseNavigationController, С>()
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
