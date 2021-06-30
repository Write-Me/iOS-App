//
//  Row.swift
//  WriteMe
//
//  Created by Vladimir on 27.09.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import Foundation

/// Any type that conforms to this protocol is capable of representing a row in a table view.
public protocol Row: class {

  /// The text of the row.
  var text: String { get }

  /// The detail text of the row.
  var detailText: DetailText? { get }

  /// A closure related to the action of the row.
  var action: ((Row) -> Void)? { get }

}
