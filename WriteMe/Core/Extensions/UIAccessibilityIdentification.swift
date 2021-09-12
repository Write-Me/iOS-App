//
//  UIAccessibilityIdentification.swift
//  WriteMe
//
//  Created by Pets-y on 11.09.2021.
//  Copyright © 2021 Vladimir Mikhaylov. All rights reserved.
//

import UIKit

/// Упрощает настройку `accessibilityIdentifier` в коде приложения, убирая boilerplate вида
/// `view.accessibilityIdentifier = AccessibilityIdentifier.someCase.rawValue`
/// Протоколу `UIAccessibilityIdentification` конформят все элементы интерфейса,
/// поддерживающие `accessibilityIdentifier`.
extension UIAccessibilityIdentification {
  var accessibilityId: AccessibilityIdentifier? {
    get {
      if let id = accessibilityIdentifier {
        return AccessibilityIdentifier.init(rawValue: id)
      }

      return nil
    }
    set {
      accessibilityIdentifier = newValue?.rawValue
    }
  }
}
