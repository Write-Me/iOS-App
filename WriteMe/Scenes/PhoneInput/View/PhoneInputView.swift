//
//  MainView.swift
//  WriteMe
//
//  Created by Vladimir Mikhaylov on 27.08.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import UIKit

struct PhoneInputMainViewSettings {
    public static let shared = PhoneInputMainViewSettings()
    let cornerRadius: CGFloat = 15
}

class PhoneInputView: UIView {
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.keyboardDismissMode = .onDrag
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()
    
    lazy var phoneInputView: InputView = {
        let view = InputView(effect: UIBlurEffect(style: .systemMaterial))
        return view
    }()
    
    lazy var whatsAppButton: SocialButton = {
        let view = SocialButton()
        view.type = .whatsapp
        return view
    }()
    
    lazy var telegrammAppButton: SocialButton = {
        let view = SocialButton()
        view.type = .telegram
        return view
    }()
    
    lazy var buttonsStack: UIStackView = {
        var  stackView = UIStackView(arrangedSubviews: [whatsAppButton])
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    init()
    {
        super.init(frame: .zero)
        backgroundColor = UIColor(named: "background")
        addSubviews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews()
    {
        [scrollView
            ]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [phoneInputView,
         buttonsStack
            ]
            .forEach {
                scrollView.addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setUpConstraints()
    {
        
        scrollView.contentSize = CGSize(width: 0, height: 500)
        
        let scrollViewConstraints = [
            scrollView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            scrollView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
        ]

        let phoneInputViewConstraints = [
            phoneInputView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16.0),
            phoneInputView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16.0),
            phoneInputView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
        ]
        
        let buttonsConstraints = [
            buttonsStack.leftAnchor.constraint(equalTo: leftAnchor, constant: 16.0),
            buttonsStack.rightAnchor.constraint(equalTo: rightAnchor, constant: -16.0),
            buttonsStack.topAnchor.constraint(equalTo: phoneInputView.bottomAnchor, constant: 16),
        ]
        
        [scrollViewConstraints, phoneInputViewConstraints, buttonsConstraints]
            .forEach(NSLayoutConstraint.activate(_:))
    }
}
