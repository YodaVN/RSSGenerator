//
//  DetailView.swift
//  RSSGenerator
//
//  Created by Nhan Nguyen on 7/15/19.
//  Copyright © 2019 Nhan Nguyen. All rights reserved.
//  nhannguyenit.work@gmail.com

import Foundation
import UIKit

class DetailView: UIView {
    var albumResult: Result! {
        didSet {
            songLabel.text = albumResult.name
            singerLabel.text = albumResult.artistName
            for genre in albumResult.genres {
                genreLabel.text = genre.name
            }
            releaseLabel.text = albumResult.releaseDate
            copyrightLabel.text = albumResult.copyright
            
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
        iv.layer.cornerRadius = 10
        iv.image = UIImage(named: "album")
        
        return iv
    }()
    
    let songLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-SemiBold", size: 17.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.sizeToFit()
        label.textAlignment = .center
        label.text = "Song name"
        
        return label
    }()
    
    let singerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-SemiBold", size: 14.0)
        label.textColor =  UIColor(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.text = "Singer"
        
        return label
    }()
    
    let genreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-SemiBold", size: 14.0)
        label.textColor =  UIColor(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.text = "Genre"
        
        return label
    }()
    
    let releaseLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-SemiBold", size: 14.0)
        label.textColor =  UIColor(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.text = "Release date"
        
        return label
    }()
    
    let copyrightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-SemiBold", size: 14.0)
        label.textColor =  UIColor(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Copyright"
        label.sizeToFit()
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
    }()
    
    let playSongButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Play", for: .normal)
        button.backgroundColor = UIColor(red: 149/255, green: 204/255, blue: 244/255, alpha: 1)
        button.layer.cornerRadius = 5.0
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    private func setupView() {
        self.addSubview(songIconImageView)
        songIconImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width/1.3).isActive = true
        songIconImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width/1.3).isActive = true
        songIconImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        songIconImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 104).isActive = true
        
        self.addSubview(playSongButton)
        playSongButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        playSongButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        playSongButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        playSongButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        playSongButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        
        self.addSubview(songLabel)
        songLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        songLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        songLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        songLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        songLabel.topAnchor.constraint(equalTo: songIconImageView.bottomAnchor, constant: 10).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [singerLabel, genreLabel, releaseLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .center
        self.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: songLabel.bottomAnchor, constant: 10),
            stackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40),
            stackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40),
            stackView.heightAnchor.constraint(equalToConstant: 100)
            ])
        
        self.addSubview(copyrightLabel)
        copyrightLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        copyrightLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        copyrightLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        copyrightLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        copyrightLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10).isActive = true
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
