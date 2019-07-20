//
//  SongDetailCell.swift
//  RSSGenerator
//
//  Created by Nhan Nguyen on 7/15/19.
//  Copyright © 2019 Nhan Nguyen. All rights reserved.
//  nhannguyenit.work@gmail.com

import UIKit

class SongDetailCell: UITableViewCell {
    var albumResult: Result! {
        didSet {
            songLabel.text = albumResult.name
            singerLabel.text = albumResult.artistName
            
            guard let url = URL(string: albumResult.artworkUrl100) else {
                return
            }
            DispatchQueue.global(qos: .userInitiated).async {
                let imageData:NSData = NSData(contentsOf: url)!
                
                DispatchQueue.main.async {
                    self.songIconImageView.image = UIImage(data: imageData as Data)
                }
            }
        }
    }
    
    let songIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 12
        
        return iv
    }()
    
    let songLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor =  UIColor(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Song name"
        
        return label
    }()
    
    let singerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Singer name"
        
        return label
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        self.initialize()
    }
    
    func initialize() {
        self.contentView.addSubview(songIconImageView)
        containerView.addSubview(songLabel)
        containerView.addSubview(singerLabel)
        self.contentView.addSubview(containerView)
        
        songIconImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        songIconImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        songIconImageView.widthAnchor.constraint(equalToConstant:70).isActive = true
        songIconImageView.heightAnchor.constraint(equalToConstant:70).isActive = true
        
        containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.songIconImageView.trailingAnchor, constant:10).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant:40).isActive = true
        
        songLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
        songLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        songLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        
        singerLabel.topAnchor.constraint(equalTo:self.songLabel.bottomAnchor).isActive = true
        singerLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        singerLabel.topAnchor.constraint(equalTo:self.songLabel.bottomAnchor).isActive = true
        singerLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not implemented")
    }
}
