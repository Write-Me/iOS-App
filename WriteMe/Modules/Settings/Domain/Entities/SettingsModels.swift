//
//  SettingsNewModels.swift
//  WriteMe
//
//  Created by swiftment.work on 11/06/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import Foundation


enum SettingsViewModel {
    case region(CellWithNavigationModel)
    case regionSwitch(CellWithSwitchModel)
    case defaultText(CellWithInputModel)
    case defaultTextSwitch(CellWithSwitchModel)
}

protocol BaseCell {
    var image: String { get }
}

protocol CellWithSwitchProtocol: BaseCell {
    var title: String { get }
    var isOn: Bool { get }
}

protocol CellWithInputDataSource: BaseCell {
    var value: String { get }
}

protocol CellWithNavigationDataSource: BaseCell {
    var title: String { get }
}

struct CellWithSwitchModel: CellWithSwitchProtocol {
    var image: String
    var title: String
    var isOn: Bool
}

struct CellWithNavigationModel: CellWithNavigationDataSource {
    var image: String
    var title: String
}

struct CellWithInputModel: CellWithInputDataSource {
    var image: String
    var value: String
}
