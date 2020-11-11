//
//  DetailText.swift
//  WriteMe
//
//  Created by Vladimir on 27.09.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import UIKit

public enum DetailText: Equatable {

  /// Does not show a detail text in `UITableViewCell.CellStyle.default`.
  case none
  case subtitle(String)
  case value1(String)
  case value2(String)

  public var style: UITableViewCell.CellStyle {
    switch self {
    case .none:     return .default
    case .subtitle: return .subtitle
    case .value1:   return .value1
    case .value2:   return .value2
    }
  }

  public var text: String? {
    switch self {
    case .none:
      return nil
    case let .subtitle(text), let .value1(text), let .value2(text):
      return text
    }
  }

}
