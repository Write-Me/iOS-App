//
//  SettingsNewViewController.swift
//  WriteMe
//
//  Created by swiftment.work on 11/06/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        $0.delegate = self
        $0.dataSource = self
        $0.isScrollEnabled = true
        $0.removeTableHeaderView()
        $0.addEmptyViewToFooter()
        $0.register(cellWithClass: CellWithSwitch.self)
        $0.register(cellWithClass: CellWithNavigation.self)
        $0.register(cellWithClass: CellWithInput.self)
        $0.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        return $0
    }(UITableView(frame: .zero, style: .insetGrouped))

    private var dataSource: SettingsPresenterDataSource?
    private var collectionDataSource: [[SettingsViewModel]] = [[]] {
        didSet {
            tableView.reloadData()
        }
    }

    init(dataSource: SettingsPresenterDataSource) {
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        self.dataSource?.setup(objectFor: self)
        self.view.backgroundColor = .white
        navigationItem.title = "Настройки"
    }
    
    private func setupViews() {
        view.addSubviews(tableView)
    }

    private func setupConstraints() {
        tableView.snp.makeConstraints {
            $0.leading.trailing.bottom.top.equalToSuperview()
        }
    }

    deinit {
        Log.t("deinit view")
    }

}

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return collectionDataSource.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collectionDataSource[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch collectionDataSource[indexPath.section][indexPath.row] {
        case .region(let model):
            let cell = tableView.dequeueReusableCell(withClass: CellWithNavigation.self)
            cell.setup(model)
            cell.cellClicked = { [weak self] in
            }
            return cell
        case .regionSwitch(let model):
            let cell = tableView.dequeueReusableCell(withClass: CellWithSwitch.self)
            cell.setup(model)
            cell.switchClicked = { [weak self] isOn in
                self?.dataSource?.regionSwitch(isOn)
            }
            return cell
        case .defaultText(let model):
            let cell = tableView.dequeueReusableCell(withClass: CellWithInput.self)
            cell.setup(model)
            cell.valueChanged = { [weak self] value in
                self?.dataSource?.defaultValue(value)
            }
            return cell
        case .defaultTextSwitch(let model):
            let cell = tableView.dequeueReusableCell(withClass: CellWithSwitch.self)
            cell.setup(model)
            cell.switchClicked = { [weak self] isOn in
                self?.dataSource?.defaultSwitch(isOn)
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    open func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        switch collectionDataSource[indexPath.section][indexPath.row] {
        case .region(let model):
            return model.isSelectable
        case .regionSwitch(let model):
            return model.isSelectable
        case .defaultText(let model):
            return model.isSelectable
        case .defaultTextSwitch(let model):
            return model.isSelectable
        }
    }
}

extension SettingsViewController: SettingsViewViewer {
    func showSections(model: [[SettingsViewModel]]) {
        collectionDataSource = model
    }
    
}
