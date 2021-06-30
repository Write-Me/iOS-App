//
//  Fonts.swift
//  WriteMe
//
//  Created by Pets-y on 29.06.2021.
//  Copyright © 2021 Vladimir Mikhaylov. All rights reserved.
//

import UIKit

/// Стили шрифтов
public struct Fonts {

    public static let h1 = UIFont.aeroport(.bold, size: 32)
    public static let h2 = UIFont.aeroport(.bold, size: 24)
    public static let h3 = UIFont.aeroport(.regular, size: 22)
    public static let h4 = UIFont.aeroport(.bold, size: 14)
    public static let h5 = UIFont.aeroport(.regular, size: 42)
    public static let h6 = UIFont.aeroport(.regular, size: 40)

    public static let title = UIFont.aeroport(.bold, size: 16)

    public static let xl = UIFont.aeroport(.regular, size: 32)
    public static let l = UIFont.aeroport(.regular, size: 18)
    public static let m = UIFont.aeroport(.regular, size: 16)
    public static let s = UIFont.aeroport(.regular, size: 14)
    public static let xs = UIFont.aeroport(.regular, size: 12)

    public static let mark = UIFont.aeroport(.bold, size: 12)
}

// Расширение для шрифтов, в случае отсутствия шрифта в дебагу будет ошибка, в релизе замена системным шрифтом
public extension UIFont {
    enum AeroportFamilyName: String {
        case regular = "Aeroport"
        case bold = "Aeroport-Bold"
    }

    static func aeroport(_ family: AeroportFamilyName, size: CGFloat) -> UIFont {
        guard let font = UIFont(name: family.rawValue, size: size) else {
            return UIFont.systemFont(ofSize: size)
        }
        return font
    }
}
