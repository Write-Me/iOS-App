//
//  SocialType.swift
//  WriteMe
//
//  Created by Vladimir Mikhaylov on 02.09.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import UIKit

public enum SocialType {
    case whatsapp
    case telegram
    
    public var color: UIColor {
        switch self {
        case .whatsapp:
            return UIColor.watsapp
        case .telegram:
            return UIColor.telegramm
        }
    }
    
    public var name: String {
        switch self {
        case .whatsapp:
            return "WhatsApp"
        case .telegram:
            return "Telegram"
        }
    }
    
    public var imageName: String {
        switch self {
        case .whatsapp:
            return "whatsapp"
        case .telegram:
            return "telegram"
        }
    }
    
    public var appUrl: String {
        switch self {
        case .whatsapp:
            return "https://api.whatsapp.com/send?phone="
        case .telegram:
            return "https://www.google.com/?client=safari"
        }
    }
    
}
