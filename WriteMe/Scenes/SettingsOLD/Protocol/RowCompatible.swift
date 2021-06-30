//
//  RowCompatible.swift
//  WriteMe
//
//  Created by Vladimir on 27.09.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import Foundation

/// This protocol defines the compatible interface of a `NavigationRow` regardless of its associated cell type.
public protocol NavigationRowCompatible: Row, RowStyle {
    var accessoryButtonAction: ((Row) -> Void)? { get }
}

/// This protocol defines the compatible interface of a `TapActionRow` regardless of its associated cell type.
public protocol TapActionRowCompatible: Row, RowStyle {}

/// This protocol defines the compatible interface of an `OptionRow` regardless of its associated cell type.
public protocol OptionRowCompatible: Row, RowStyle {
    /// The state of selection.
    var isSelected: Bool { get set }
}

/// This protocol defines the compatible interface of a `SwitchRow` regardless of its associated cell type.
public protocol SwitchRowCompatible: Row, RowStyle {
    /// The state of the switch.
    var switchValue: Bool { get set }
}

public protocol InputRowCompatible: Row, RowStyle {
    var placeholder: String? { get set }
    var inputValue: String? { get set }
}
