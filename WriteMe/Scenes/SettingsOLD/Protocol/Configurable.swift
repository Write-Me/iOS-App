//
//  Configurable.swift
//  WriteMe
//
//  Created by Vladimir on 27.09.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import UIKit

public protocol Configurable {
  func configure(with row: Row & RowStyle)
}

extension UITableViewCell {

  internal func defaultSetUp(with row: Row & RowStyle) {
    textLabel?.text = row.text
    detailTextLabel?.text = row.detailText?.text

    // Reset the accessory view in case the cell is reused.
    accessoryView = nil
    accessoryType = row.accessoryType

    imageView?.image = row.icon?.image
    imageView?.highlightedImage = row.icon?.highlightedImage
  }

}
