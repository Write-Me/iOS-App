//
//  RegionListViewController.swift
//  WriteMe
//
//  Created by swiftment.work on 11/11/2021.
//  Copyright © 2021 WriteMe. All rights reserved.
//

import UIKit

class RegionListViewController: UIViewController {

    lazy var tableView: UITableView = {
        $0.delegate = self
        $0.dataSource = self
        $0.register(cellWithClass: UITableViewCell.self)
        return $0
    }(UITableView(frame: .zero, style: .insetGrouped))

    private var regions: [Region] = []

    private var dataSource: RegionListPresenterDataSource?

    init(dataSource: RegionListPresenterDataSource) {
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
    }

    private func setupViews() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = NSLocalizedString("RegionSelect", comment: "")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"),
                                                            style: .plain,
                                                            target: self ,
                                                            action: #selector(navigateToRegionAdd))
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

extension RegionListViewController: RegionListViewViewer {
}

// @obc
extension RegionListViewController {
    @objc private func navigateToRegionAdd() {
        dataSource?.navigateToRegion()
    }
}

extension RegionListViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return regions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: UITableViewCell.self)
        cell.textLabel?.text = regions[indexPath.row].name + " " + regions[indexPath.row].phoneCode
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }

}
