//
//  NavigationRow.swift
//  WriteMe
//
//  Created by Vladimir on 27.09.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import UIKit

open class NavigationRow<T: UITableViewCell>: NavigationRowCompatible {

    // MARK: - Initializer

    public init(
        text: String,
        detailText: DetailText,
        icon: Icon? = nil,
        customization: ((UITableViewCell, Row & RowStyle) -> Void)? = nil,
        action: ((Row) -> Void)? = nil,
        accessoryButtonAction: ((Row) -> Void)? = nil
    ) {
        self.text = text
        self.detailText = detailText
        self.icon = icon
        self.customize = customization
        self.action = action
        self.accessoryButtonAction = accessoryButtonAction
    }

    // MARK: - Row

    public let text: String
    public let detailText: DetailText?
    public let action: ((Row) -> Void)?
    public let accessoryButtonAction: ((Row) -> Void)?

    // MARK: - RowStyle

    public let cellType: UITableViewCell.Type = T.self

    public var cellReuseIdentifier: String {
        return "navigationRowCellId"
    }

    public var cellStyle: UITableViewCell.CellStyle {
        return detailText?.style ?? .default
    }

    public let icon: Icon?

    public var accessoryType: UITableViewCell.AccessoryType {
        switch (action, accessoryButtonAction) {
        case (nil, nil):      return .none
        case (.some, nil):    return .disclosureIndicator
        case (nil, .some):    return .detailButton
        case (.some, .some):  return .detailDisclosureButton
        }
    }

    public var isSelectable: Bool {
        return action != nil
    }

    public let customize: ((UITableViewCell, Row & RowStyle) -> Void)?

}

internal extension UITableViewCell.CellStyle {

    var stringValue: String {
        switch self {
        case .default:    return ".default"
        case .subtitle:   return ".subtitle"
        case .value1:     return ".value1"
        case .value2:     return ".value2"
        @unknown default: return ".default"
        }
    }

}
