//
//  TapActionRow.swift
//  WriteMe
//
//  Created by Vladimir on 27.09.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import UIKit

open class TapActionRow<T: TapActionCell>: TapActionRowCompatible {
    
    // MARK: - Initializer
    
    public init(
        text: String,
        customization: ((UITableViewCell, Row & RowStyle) -> Void)? = nil,
        action: ((Row) -> Void)?
    ) {
        self.text = text
        self.customize = customization
        self.action = action
    }
    
    // MARK: - Row
    
    public let text: String
    public let detailText: DetailText? = nil
    public let action: ((Row) -> Void)?
    
    // MARK: - RowStyle
    
    public let cellType: UITableViewCell.Type = T.self
    public let cellReuseIdentifier: String = "tapActionRowCellId"
    public let cellStyle: UITableViewCell.CellStyle = .default
    public let icon: Icon? = nil
    public let accessoryType: UITableViewCell.AccessoryType = .none
    
    public var isSelectable: Bool {
        return action != nil
    }
    
    public let customize: ((UITableViewCell, Row & RowStyle) -> Void)?
    
}
