//
//  RegionAddView.swift
//  WriteMe
//
//  Created by Vladimir on 13.11.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import UIKit

class RegionAddView: UIView {
    
    init()
    {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews()
    {
        backgroundColor = .yellow
    }
}
