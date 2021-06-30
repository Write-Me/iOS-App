//
//  SettingsModel.swift
//  WriteMe
//
//  Created by Vladimir on 02.10.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import Foundation

enum SettingsOLDModel {
    
    enum ApplySettings {
        
        // vc -> interactor
        struct Request {
        }
        
        // interactor -> presenter
        struct Response {
            let settings: Settings
        }
        
        // presenter -> vc
        struct ViewModel {
            let settings: Settings
        }
    }
    
    enum ToggleIsRegionOn {
        
        // vc -> interactor
        struct Request {
        }
        
        // interactor -> presenter
        struct Response {
        }
        
        // presenter -> vc
        struct ViewModel {
        }
    }
    
    enum ToggleIsDefaultTextOn {
        
        // vc -> interactor
        struct Request {
        }
        
        // interactor -> presenter
        struct Response {
        }
        
        // presenter -> vc
        struct ViewModel {
        }
    }
    
    enum SetDefaultText {
        
        // vc -> interactor
        struct Request {
            let value: String?
        }
        
        // interactor -> presenter
        struct Response {
        }
        
        // presenter -> vc
        struct ViewModel {
        }
    }
    
}

