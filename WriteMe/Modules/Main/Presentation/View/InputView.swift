//
//  PhoneInputView.swift
//  WriteMe
//
//  Created by Vladimir Mikhaylov on 27.08.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import UIKit

class InputView: UIVisualEffectView {
    
    lazy var inputTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = NSLocalizedString("Phone", comment: "Phone")
        textField.textAlignment = .left
        textField.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        textField.keyboardType = .decimalPad
        return textField
    }()
    
    override init(effect: UIVisualEffect?) {
        super.init(effect: effect)
        layer.masksToBounds = true
        layer.cornerRadius = PhoneInputMainViewSettings.shared.cornerRadius
        addSubviews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        [inputTextField]
            .forEach {
                contentView.addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setUpConstraints() {

        let constraints = [
            heightAnchor.constraint(equalToConstant: 100.0)
        ]
        
        let phoneTextFieldСonstraints = [
            inputTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20.0),
            inputTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40.0),
            inputTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            inputTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
        ]
        
        [constraints, phoneTextFieldСonstraints]
            .forEach(NSLayoutConstraint.activate(_:))
    }
}
