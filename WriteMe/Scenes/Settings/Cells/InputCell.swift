//
//  InputCell.swift
//  WriteMe
//
//  Created by Vladimir on 09.10.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import UIKit

public protocol InputCellDelegate: class {
  func inputCell(_ cell: InputCell, inputValue: String?)
}

open class InputCell: UITableViewCell, Configurable
{
    
    let view = IntputCellContentView()
    open weak var delegate: InputCellDelegate?
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpAppearance()
        setupView()
    }
    
    public required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setUpAppearance()
        setupView()
    }
    
    private func setupView()
    {
        view.delegate = self
        addSubviews()
        setUpConstraints()
    }
    
    private func addSubviews()
    {
        [view]
        .forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setUpConstraints()
    {
        let viewConstraints = [
            view.leftAnchor.constraint(equalTo: imageView?.rightAnchor ?? leftAnchor, constant: 0.0),
            view.rightAnchor.constraint(equalTo: rightAnchor, constant: 0.0),
            view.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
        ]
        
        [viewConstraints]
            .forEach(NSLayoutConstraint.activate(_:))
    }
    
    private func setUpAppearance()
    {
    }
}

extension InputCell
{
    public func configure(with row: Row & RowStyle)
    {
        if let row = row as? InputRowCompatible {
            view.textField.placeholder = row.placeholder
            view.textField.text = row.inputValue
        }
    }
}

class IntputCellContentView: UIView, UITextFieldDelegate {
    
    public lazy var textField: UITextField = {
        let textField = UITextField()
        textField.delegate = self
        return textField
    }()
    
    open weak var delegate: InputCell?
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView()
    {
        backgroundColor = .clear
        addSubviews()
        setUpConstraints()
    }
    
    private func addSubviews()
    {
        [textField]
        .forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setUpConstraints()
    {
        let viewConstraints = [
            textField.leftAnchor.constraint(equalTo: leftAnchor, constant: 16.0),
            textField.rightAnchor.constraint(equalTo: rightAnchor, constant: 0.0),
            textField.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
        ]
        
        [viewConstraints]
            .forEach(NSLayoutConstraint.activate(_:))
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        delegate?.delegate?.inputCell(delegate ?? InputCell() , inputValue: "\(textField.text ?? "")\(string)")
        return true
    }
}
