//
//  SocialButton.swift
//  WriteMe
//
//  Created by Vladimir Mikhaylov on 27.08.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import UIKit

class SocialButton: UIButton {

    lazy var socialImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.isHidden = true
        return view
    }()

    public var type: SocialType = .whatsapp {
        didSet {
            setupType()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.masksToBounds = false
        layer.cornerRadius = PhoneInputMainViewSettings.shared.cornerRadius
        backgroundColor = UIColor(named: "base-green")
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 32, weight: .regular)
        addSubviews()
        setUpConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubviews() {
        [socialImageView]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }

    private func setUpConstraints() {

        let constraints = [
            heightAnchor.constraint(equalToConstant: 70)
        ]

        let imageViewСonstraints = [
            socialImageView.heightAnchor.constraint(equalToConstant: 90),
            socialImageView.widthAnchor.constraint(equalToConstant: 90),
            socialImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -4),
            socialImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0)
        ]

        [constraints, imageViewСonstraints]
            .forEach(NSLayoutConstraint.activate(_:))
    }

    private func setupType() {
        backgroundColor = self.type.color
        setTitle(self.type.name, for: .normal)
        socialImageView.image = UIImage(named: self.type.imageName)
    }

}
