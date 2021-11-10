//
//  Extension.swift
//  WriteMe
//
//  Created by Vladimir on 09.10.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import Foundation
import UIKit

extension String {
    var encodeUrl: String {
        return self.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
    }
    var decodeUrl: String {
        return self.removingPercentEncoding!
    }
}

extension UINavigationController {
    var previousViewController: UIViewController? {
       viewControllers.count > 1 ? viewControllers[viewControllers.count - 2] : nil
    }
}
