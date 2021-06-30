//
//  CellWithSwitch.swift
//  WriteMe
//
//  Created by Pets-y on 29.06.2021.
//  Copyright © 2021 Vladimir Mikhaylov. All rights reserved.
//

import UIKit
import SnapKit

class CellWithSwitch: UITableViewCell {

    var switchClicked: ((_ isOn: Bool) -> ())?

    private lazy var title: Label = {
        $0.textColor = .black
        $0.text = "Вход в приложение"
        return $0
    }(Label(font: Fonts.xs))

    private lazy var value: Label = {
        $0.textColor = .black
        $0.text = "Вход по FaceID"
        return $0
    }(Label(font: Fonts.l))

    private lazy var switcher: UISwitch = {
        $0.onTintColor = .black
        return $0
    }(UISwitch())

    private lazy var devider: UIView = {
        $0.backgroundColor = .black
        return $0
    }(UIView())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        switcher.addTarget(self, action: #selector(switchClicked(_:)), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        contentView.addSubviews(title,
                                value,
                                switcher,
                                devider)
    }

    private func setupConstraints() {
//        snp.makeConstraints {
//            $0.width.equalTo(UIScreen.main.bounds.width)
//        }
//
//        contentView.snp.makeConstraints {
//            $0.top.bottom.leading.trailing.equalToSuperview()
//        }

        title.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview().offset(24)
        }

        value.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(20)
            $0.left.equalTo(title.snp.left)
        }

        switcher.snp.makeConstraints {
            $0.right.equalToSuperview().inset(24)
            $0.centerY.equalTo(value.snp.centerY)
        }

        devider.snp.makeConstraints {
            $0.top.equalTo(value.snp.bottom).offset(19)
            $0.left.equalToSuperview().inset(24)
            $0.right.equalTo(switcher.snp.right)
            $0.height.equalTo(1)
            $0.bottom.equalToSuperview()
        }
    }

    @objc private func switchClicked(_ switcher: UISwitch) {
        if let action = self.switchClicked {
            action(switcher.isOn)
        }
    }

    public func setup(_ model: CellWithSwitchProtocol) {
        title.text = model.title
        switcher.isOn = model.isOn
    }
}
