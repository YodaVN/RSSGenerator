//
//  Service.swift
//  RSSGenerator
//
//  Created by Nhan Nguyen on 7/15/19.
//  Copyright © 2019 Nhan Nguyen. All rights reserved.
//  nhannguyenit.work@gmail.com

import Foundation

class Service {
    static let shared = Service()

    func fetchAlbum(completion: @escaping ([Result], Error?) -> ()) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/50/explicit.json"
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                print("Failed to fetch albums:", err)
                completion([], nil)
                
                return
            }
            
            guard let data = data else { return }
            
            do {
                let albumResult = try JSONDecoder().decode(AlbumResult.self, from: data)
                completion(albumResult.feed.results, nil)
                
            } catch let error as NSError {
                print("Failed to decode json:", error)
                completion([], error)
            }
            
            }.resume()
    }
}
