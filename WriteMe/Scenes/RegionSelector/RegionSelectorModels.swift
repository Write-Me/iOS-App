//
//  RegionSelectorModels.swift
//  WriteMe
//
//  Created by Vladimir Mikhaylov on 03.10.2020.
//  Copyright (c) 2020 Vladimir Mikhaylov. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum RegionSelector
{
    // MARK: Use cases
    enum FetchRegion
    {
        struct Request
        {
        }
        struct Response
        {
            let regions: [Region]
        }
        struct ViewModel
        {
            let regions: [Region]
        }
    }
    
    enum SaveRegion
    {
        struct Request
        {
            let region: Region
        }
        struct Response
        {
        }
        struct ViewModel
        {
        }
    }
}
