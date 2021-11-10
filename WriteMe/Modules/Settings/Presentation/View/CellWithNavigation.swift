//
//  CellWithNavigation.swift
//  WriteMe
//
//  Created by Pets-y on 01.07.2021.
//  Copyright © 2021 Vladimir Mikhaylov. All rights reserved.
//

import UIKit

class CellWithNavigation: UITableViewCell {

    var cellClicked: (() -> Void)?

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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        let tap = UITapGestureRecognizer(target: self, action: #selector(isCellClicked))
        addGestureRecognizer(tap)
        accessoryType = .disclosureIndicator
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        contentView.addSubviews(
            image,
            title)
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

    }

    @objc private func isCellClicked() {
        if let action = self.cellClicked {
            action()
        }
    }

    public func setup(_ model: CellWithNavigationModel) {
        image.image = model.image.image
        title.text = model.title
    }
}
