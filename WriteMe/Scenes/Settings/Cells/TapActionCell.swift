//
//  TapActionCell.swift
//  WriteMe
//
//  Created by Vladimir on 27.09.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import UIKit

open class TapActionCell: UITableViewCell {

  public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: .default, reuseIdentifier: reuseIdentifier)
    setUpAppearance()
  }

  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setUpAppearance()
  }

  open override func tintColorDidChange() {
    super.tintColorDidChange()
    textLabel?.textColor = tintColor
  }

  // MARK: Private Methods

  private func setUpAppearance() {
    textLabel?.numberOfLines = 0
    textLabel?.textAlignment = .center
    textLabel?.textColor = tintColor
  }
}

