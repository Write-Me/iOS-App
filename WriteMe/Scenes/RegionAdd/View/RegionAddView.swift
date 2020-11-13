//
//  RegionAddView.swift
//  WriteMe
//
//  Created by Vladimir on 13.11.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import UIKit

class RegionAddView: UIView {
    
    lazy var nameInputView: InputView = {
        let view = InputView(effect: UIBlurEffect(style: .systemMaterial))
        view.inputTextField.placeholder = NSLocalizedString("RegionName", comment: "")
        view.inputTextField.keyboardType = .default
        return view
    }()
    
    lazy var codeInputView: InputView = {
        let view = InputView(effect: UIBlurEffect(style: .systemMaterial))
        view.inputTextField.placeholder = NSLocalizedString("RegionPhoneCode", comment: "")
        view.inputTextField.keyboardType = .decimalPad
        return view
    }()
    
    init()
    {
        super.init(frame: .zero)
        setupViews()
        addSubviews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews()
    {
        backgroundColor = .systemGray6
    }
    
    private func addSubviews()
    {
        [nameInputView,
         codeInputView
            ]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
    }
    
    private func setUpConstraints()
    {
        let nameInputViewConstraints = [
            nameInputView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16.0),
            nameInputView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16.0),
            nameInputView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
        ]
        
        let codeInputViewViewConstraints = [
            codeInputView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16.0),
            codeInputView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16.0),
            codeInputView.topAnchor.constraint(equalTo: nameInputView.bottomAnchor, constant: 8),
        ]
        
        [nameInputViewConstraints, codeInputViewViewConstraints]
            .forEach(NSLayoutConstraint.activate(_:))
    }
    
}
