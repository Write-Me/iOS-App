
//
//  SocialAppModel.swift
//  WriteMe
//
//  Created by Vladimir Mikhaylov on 02.09.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import Foundation
import UIKit

enum PhoneInputModel {
    
    enum ToApp {
        
        // vc -> interactor
        struct Request {
            let socialType: SocialType
            let phone: String?
            let sender: UIButton?
        }
        
        // interactor -> presenter
        struct Response {
            let socialType: SocialType
            let sender: UIButton?
        }
        
        // presenter -> vc
        struct ViewModel {
            let socialType: SocialType
        }
    }
}
