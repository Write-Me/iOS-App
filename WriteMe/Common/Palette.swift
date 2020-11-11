//
//  Palette.swift
//  WriteMe
//
//  Created by Vladimir Mikhaylov on 31.08.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.xt
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor.init(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    static var watsapp = UIColor(named: "base-green") ?? .black
    static var telegramm = UIColor.rgb(red: 0, green: 136, blue: 204)
}
