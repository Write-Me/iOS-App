//
//  MainModels.swift
//  WriteMe
//
//  Created by swiftment.work on 06/06/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import Foundation

struct MainViewModel {
    var inputMask: String?
    var needApplyMask: Bool = false

    init(_ model: MainModel) {
        self.inputMask = model.inputMask
        self.needApplyMask = model.needApplyMask
    }
    
    init(_ model: Settings) {
        self.needApplyMask = model.isRegionOn
        let regionPhoneCode = model.region?.phoneCode ?? "+7"
        self.inputMask = "\(regionPhoneCode)[000000000000000000000000]"
    }
}

struct MainModel {
    var inputMask: String?
    var needApplyMask: Bool
}
