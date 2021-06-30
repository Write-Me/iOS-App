//
//  SwitchRow.swift
//  WriteMe
//
//  Created by Vladimir on 27.09.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import UIKit

open class SwitchRow<T: SwitchCell>: SwitchRowCompatible {
    
    
    // MARK: - Initializer
    
    public init(
        text: String,
        detailText: DetailText? = nil,
        switchValue: Bool,
        icon: Icon? = nil,
        customization: ((UITableViewCell, Row & RowStyle) -> Void)? = nil,
        action: ((Row) -> Void)?
    ) {
        self.text = text
        self.detailText = detailText
        self.switchValue = switchValue
        self.icon = icon
        self.customize = customization
        self.action = action
    }
    
    // MARK: - SwitchRowCompatible
    
    public var switchValue: Bool = false {
        didSet {
            guard switchValue != oldValue else {
                return
            }
            DispatchQueue.main.async {
                self.action?(self)
            }
        }
    }
    
    // MARK: - Row
    
    public let text: String
    public let detailText: DetailText?
    public let action: ((Row) -> Void)?
    
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
