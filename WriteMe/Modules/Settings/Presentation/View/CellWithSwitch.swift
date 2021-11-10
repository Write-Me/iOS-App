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

    var switchClicked: ((_ isOn: Bool) -> Void)?

    private lazy var image: UIImageView = {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "phone-code")
        return $0
    }(UIImageView())

    private lazy var title: Label = {
        $0.textColor = .label
        $0.text = "Вход в приложение"
        return $0
    }(Label(font: Fonts.m))

    private lazy var switcher: UISwitch = {
        return $0
    }(UISwitch())

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
        contentView.addSubviews(
            image,
            title,
            switcher)
    }

    private func setupConstraints() {

        image.snp.makeConstraints {
            $0.width.height.equalTo(30)
            $0.left.equalToSuperview().offset(10)
            $0.centerY.equalToSuperview()
        }

        title.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(image.snp.right).offset(10)
        }

        switcher.snp.makeConstraints {
            $0.right.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
        }
    }

    @objc private func switchClicked(_ switcher: UISwitch) {
        if let action = self.switchClicked {
            action(switcher.isOn)
        }
    }

    public func setup(_ model: CellWithSwitchProtocol) {
        image.image = model.image.image
        title.text = model.title
        switcher.isOn = model.isOn
    }
}
