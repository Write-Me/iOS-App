//
//  InputRow.swift
//  WriteMe
//
//  Created by Vladimir on 09.10.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import UIKit

open class InputRow<T: InputCell>: InputRowCompatible {

    public init(
        placeholder: String?,
        inputValue: String? = nil,
        icon: Icon? = nil,
        customization: ((UITableViewCell, Row & RowStyle) -> Void)? = nil,
        action: ((Row) -> Void)?
    ) {
        self.placeholder = placeholder
        self.inputValue = inputValue
        self.icon = icon
        self.customize = customization
        self.action = action
    }

    // MARK: - Row

    public let text: String = ""
    public let detailText: DetailText? = nil
    public let action: ((Row) -> Void)?
    public var inputValue: String?
    public var placeholder: String?

    // MARK: - RowStyle
    public let cellType: UITableViewCell.Type = T.self

    public var cellReuseIdentifier: String {
        return "switchRowCellId"
    }

    public var cellStyle: UITableViewCell.CellStyle {
        return detailText?.style ?? .default
    }

    public let icon: Icon?
    public let accessoryType: UITableViewCell.AccessoryType = .none
    public let isSelectable: Bool = false
    public let customize: ((UITableViewCell, Row & RowStyle) -> Void)?
}
