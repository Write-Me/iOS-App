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
            $0.leading.trailing.top.bottom.equalToSuperview()
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
            break
        case .regionSwitch(let model):
            break
        case .defaultText(let model):
            break
        case .defaultTextSwitch(let model):
            break
        }
        let cell = tableView.dequeueReusableCell(withClass: CellWithSwitch.self)
        cell.switchClicked = { [weak self] isEnabled in
            Log.i(isEnabled)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension SettingsViewController: SettingsViewViewer {
    func showSections(model: [[SettingsViewModel]]) {
        collectionDataSource = model
    }
    
}
