//
//  DetailViewController.swift
//  RSSGenerator
//
//  Created by Nhan Nguyen on 7/15/19.
//  Copyright © 2019 Nhan Nguyen. All rights reserved.
//  nhannguyenit.work@gmail.com

import Foundation
import UIKit

class DetailViewController: UIViewController {
    var detailView: DetailView! = DetailView(frame: .zero)
    var albumResult: Result!
    
    override func loadView() {
        self.view = detailView
        self.view.backgroundColor = UIColor(red: CGFloat(220.0/255.0), green: CGFloat(223.0/255.0), blue: CGFloat(227.0/255.0), alpha: CGFloat(1.0))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detail"
        navigationController?.navigationBar.tintColor = .black
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func updateUI() {
        self.detailView.albumResult = self.albumResult
        self.detailView.playSongButton.addTarget(self, action: #selector(handlePlay), for: .touchUpInside)
    }
    
    @objc func handlePlay() {
        if let url = URL(string: self.albumResult.url) {
            UIApplication.shared.open(url)
        }
    }
}
