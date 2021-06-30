//
//  RowStyle.swift
//  WriteMe
//
//  Created by Vladimir on 27.09.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import UIKit

/// Any type that conforms to this protocol carries the info for the UI.
public protocol RowStyle {

  /// The type of the table view cell to display the row.
  var cellType: UITableViewCell.Type { get }

  /// The reuse identifier of the table view cell to display the row.
  var cellReuseIdentifier: String { get }

  /// The style of the table view cell to display the row.
  var cellStyle: UITableViewCell.CellStyle { get }

  /// The icon of the row.
  var icon: Icon? { get }

  /// The type of standard accessory view the cell should use.
  var accessoryType: UITableViewCell.AccessoryType { get }

  /// The flag that indicates whether the table view cell should trigger the action when selected.
  var isSelectable: Bool { get }

  /// The additional customization during cell configuration.
  var customize: ((UITableViewCell, Row & RowStyle) -> Void)? { get }

}
