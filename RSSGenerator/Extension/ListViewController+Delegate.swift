//
//  ListViewController+Delegate.swift
//  RSSGenerator
//
//  Created by Nhan Nguyen on 7/15/19.
//  Copyright © 2019 Nhan Nguyen. All rights reserved.
//  nhannguyenit.work@gmail.com

import UIKit

extension ListViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        navigationController?.navigationBar.prefersLargeTitles = false
        detailViewController.albumResult = self.albumResults[indexPath.row]
        detailViewController.updateUI()
        
        navigationController?.pushViewController(detailViewController, animated: false)
    }
}
