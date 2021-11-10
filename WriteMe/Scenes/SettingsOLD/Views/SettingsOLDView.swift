//
//  InfoView.swift
//  WriteMe
//
//  Created by Vladimir on 24.09.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import UIKit

class SettingsOLDView: UIView {

    private let cellID = "cellID"
    public weak var delegate: SettingsOLDViewController?
    private var sections: [Section] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.keyboardDismissMode = .onDrag
        return tableView
    }()

    init() {
        super.init(frame: .zero)
        addSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setup(settings: Settings) {
        sections = [
            Section(
                title: nil,
                rows: [
                        NavigationRow(text: NSLocalizedString("RegionSelect", comment: ""), detailText: .value1("\(settings.region?.phoneCode ?? "") \(settings.region?.name ?? "")"),
                                      icon: .named("phone-code"), action: { _ in
                                        self.delegate?.router?.routeToRegionSelector()
                                      }),
                        SwitchRow(text: NSLocalizedString("RegionUse", comment: ""), switchValue: settings.isRegionOn,
                                  icon: .named("region"), action: { _ in
                                    self.delegate?.interactor?.switchIsRegionOn(SettingsOLDModel.ToggleIsRegionOn.Request())
                                  })
                    ],
                footer: nil
            ),
            Section(
                title: nil,
                rows: [
                        InputRow(placeholder: NSLocalizedString("WAppDefaultTextSettingPlaceholder", comment: ""), inputValue: settings.defaultText, icon: .named("chat"), action: nil),
                        SwitchRow(text: NSLocalizedString("WAppDefaultTextSettingEnable", comment: ""), switchValue: settings.isDefaultTextOn,
                                  icon: .named("power"), action: { _ in
                                    self.delegate?.interactor?.toggleIsDefaultTextOn(SettingsOLDModel.ToggleIsDefaultTextOn.Request())
                                  })
                    ],
                footer: NSLocalizedString("WAppDefaultTextSettingFooter", comment: "")
            )
        ]
    }

    public func setupSections(sections: [Section]) {
        self.sections = sections
    }

    private func addSubviews() {
        [tableView
        ]
        .forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }

    private func setupConstraints() {
        let tableViewConstraints = [
            tableView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0.0),
            tableView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0.0),
            tableView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ]

        [tableViewConstraints]
            .forEach(NSLayoutConstraint.activate(_:))
    }

}

extension SettingsOLDView: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section].title
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].rows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let row = sections[indexPath.section].rows[indexPath.row]
        let cell =
            tableView.dequeueReusableCell(withIdentifier: row.cellReuseIdentifier) ??
            row.cellType.init(style: row.cellStyle, reuseIdentifier: row.cellReuseIdentifier)
        cell.defaultSetUp(with: row)
        (cell as? Configurable)?.configure(with: row)
        (cell as? SwitchCell)?.delegate = self
        (cell as? InputCell)?.delegate = self
        row.customize?(cell, row)
        return cell
    }

    open func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return sections[section].footer
    }

    // MARK: - UITableViewDelegate

    open func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return sections[indexPath.section].rows[indexPath.row].isSelectable
    }

    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = sections[indexPath.section]
        let row = section.rows[indexPath.row]

        switch (section, row) {
        case let (radio as RadioSection, option as OptionRowCompatible):
            let changes: [IndexPath] = radio.toggle(option).map {
                IndexPath(row: $0, section: indexPath.section)
            }
            if changes.isEmpty {
                tableView.deselectRow(at: indexPath, animated: false)
            } else {
                tableView.reloadRows(at: changes, with: .automatic)
            }

        case let (_, option as OptionRowCompatible):
            // Allow OptionRow to be used without RadioSection.
            option.isSelected = !option.isSelected
            tableView.reloadData()

        case (_, is TapActionRowCompatible):
            tableView.deselectRow(at: indexPath, animated: true)
            // Avoid some unwanted animation when the action also involves table view reload.
            DispatchQueue.main.async {
                row.action?(row)
            }

        case let (_, row) where row.isSelectable:
            DispatchQueue.main.async {
                row.action?(row)
            }

        default:
            break
        }
    }

    public func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        switch sections[indexPath.section].rows[indexPath.row] {
        case let row as NavigationRowCompatible:
            DispatchQueue.main.async {
                row.accessoryButtonAction?(row)
            }
        default:
            break
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }

}

extension SettingsOLDView: SwitchCellDelegate {

    // MARK: - SwitchCellDelegate
    open func switchCell(_ cell: SwitchCell, didToggleSwitch isOn: Bool) {
        guard
            let indexPath = tableView.indexPath(for: cell),
            let row = sections[indexPath.section].rows[indexPath.row] as? SwitchRowCompatible
        else {
            return
        }
        row.switchValue = isOn
    }

}

extension SettingsOLDView: InputCellDelegate {
    func inputCell(_ cell: InputCell, inputValue: String?) {
        delegate?.interactor?.setDefaultText(SettingsOLDModel.SetDefaultText.Request(value: inputValue))
    }
}
