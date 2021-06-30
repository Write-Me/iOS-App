//
//  SwitchCell.swift
//  WriteMe
//
//  Created by Vladimir on 27.09.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import UIKit

public protocol SwitchCellDelegate: class {
  func switchCell(_ cell: SwitchCell, didToggleSwitch isOn: Bool)
}

open class SwitchCell: UITableViewCell, Configurable {

  public private(set) lazy var switchControl: UISwitch = {
    let control = UISwitch()
    control.addTarget(self, action: #selector(SwitchCell.didToggleSwitch(_:)), for: .valueChanged)
    return control
  }()

  open weak var delegate: SwitchCellDelegate?

  // MARK: - Initializer

  public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setUpAppearance()
  }

  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setUpAppearance()
  }

  // MARK: - Configurable
  open func configure(with row: Row & RowStyle) {
      if let row = row as? SwitchRowCompatible {
        switchControl.isOn = row.switchValue
      }
      accessoryView = switchControl
  }

  // MARK: - Private
  @objc
  private func didToggleSwitch(_ sender: UISwitch) {
    delegate?.switchCell(self, didToggleSwitch: sender.isOn)
  }

  private func setUpAppearance() {
    textLabel?.numberOfLines = 0
    detailTextLabel?.numberOfLines = 0
  }

}
