//
//  RegionView.swift
//  WriteMe
//
//  Created by Vladimir on 07.10.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import UIKit

class RegionView: UIView
{
    var viewController: RegionSelectorViewController?
    private let cellID = "cellID"
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        return tableView
    }()
    
    private var regions: [Region] = []
    
    init()
    {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews()
    {
        addSubviews()
        setUpConstraints()
    }
    
    private func addSubviews()
    {
        [tableView
            ]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setUpConstraints()
    {
        let tableViewConstraints = [
            tableView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0.0),
            tableView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0.0),
            tableView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
        ]
        
        [tableViewConstraints]
            .forEach(NSLayoutConstraint.activate(_:))
    }
    
    public func setupData(regions: [Region])
    {
        self.regions = regions
        tableView.reloadData()
    }
}

extension RegionView: UITableViewDataSource, UITableViewDelegate
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return regions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID)!
        cell.textLabel?.text = regions[indexPath.row].name + " " + regions[indexPath.row].phoneCode
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        viewController?.interactor?.saveRegion(reguest: RegionSelector.SaveRegion.Request(region: regions[indexPath.row]))
    }
    
}
