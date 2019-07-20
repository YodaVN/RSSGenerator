//
//  ListTableViewController.swift
//  RSSGenerator
//
//  Created by Nhan Nguyen on 7/15/19.
//  Copyright © 2019 Nhan Nguyen. All rights reserved.
//  nhannguyenit.work@gmail.com

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    weak var tableView: UITableView!
    private let cellId = "SongCell"
    var albumResults = [Result]()
    
    override func loadView() {
        super.loadView()
        
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            self.view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: tableView.topAnchor),
            self.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: tableView.bottomAnchor),
            self.view.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
            self.view.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
        ])
        self.tableView = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(SongDetailCell.self, forCellReuseIdentifier: cellId)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        Service.shared.fetchAlbum { (res, err) in
            self.albumResults = res
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
