//
//  ImageKey.swift
//  WriteMe
//
//  Created by Pets-y on 01.07.2021.
//  Copyright © 2021 Vladimir Mikhaylov. All rights reserved.
//

import UIKit
public typealias ImageName = String

public enum ImageKey {
    public enum Settings: ImageName {
        case phone = "phone-code"
        case region = "region"
        case chat = "chat"
        case power = "power"
    }
}

public extension RawRepresentable where RawValue == ImageName {
    var image: UIImage {
        return UIImage.image(for: rawValue)
    }
}

extension ImageName {
    public var image: UIImage {
        return UIImage.image(for: self)
    }
}

extension UIImage {
    public static func image(for key: ImageName) -> UIImage {
        return UIImage(named: key) ?? UIImage()
    }
}
