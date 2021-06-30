//
//  CellWithInput.swift
//  WriteMe
//
//  Created by Pets-y on 01.07.2021.
//  Copyright © 2021 Vladimir Mikhaylov. All rights reserved.
//

import UIKit

class CellWithInput: UITableViewCell {

    var valueChanged: ((_ value: String?) -> ())?
    
    private lazy var image: UIImageView = {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "phone-code")
        return $0
    }(UIImageView())

    private lazy var input: UITextField = {
        $0.placeholder = "По умолчанию"
        return $0
    }(UITextField())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        input.addTarget(self, action: #selector(isValueChanged), for: .allEditingEvents)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        contentView.addSubviews(
            image,
            input)
    }

    private func setupConstraints() {

        image.snp.makeConstraints {
            $0.width.height.equalTo(30)
            $0.left.equalToSuperview().offset(10)
            $0.centerY.equalToSuperview()
        }

        input.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(image.snp.right).offset(10)
            $0.right.equalToSuperview().inset(20)
        }

    }

    @objc private func isValueChanged() {
        if let action = self.valueChanged {
            action(input.text)
        }
    }

    public func setup(_ model: CellWithInputModel) {
        image.image = model.image.image
        input.text = model.value
    }
}
