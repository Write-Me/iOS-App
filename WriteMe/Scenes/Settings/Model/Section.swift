//
//  Section.swift
//  WriteMe
//
//  Created by Vladimir on 27.09.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import Foundation

open class Section {

  // MARK: - Initializer

  public init(title: String?, rows: [Row & RowStyle], footer: String? = nil) {
    self.title = title
    self.rows = rows
    self.footer = footer
  }

  // MARK: - Properties

  public let title: String?
  open var rows: [Row & RowStyle]
  open var footer: String?

}
