//
//  ViewModel.swift
//  RandomGAG
//
//  Created by Danny on 6/18/17.
//  Copyright © 2017 Danny. All rights reserved.
//

import UIKit
import SwiftSoup

class ViewModel {
    var networkManager: NetworkManager!
    var posts = [Post]()
    var reload: Bool
    var url: String

    
    init() {
        networkManager = NetworkManager()
        url = "http://9gag.com/girl"
        reload = false
    }
    
    func fetchPosts(completion: @escaping ([Post]) -> ()) {
        self.posts.removeAll()
        if reload {
            url = "http://9gag.com" + networkManager.reloadURL!
            print(url)
        }
        
        networkManager.getDataFromURL(with: url) { [weak self] posts in
            guard let strongSelf = self else { return }
            strongSelf.posts = posts
            completion(strongSelf.posts)
        }
        
        reload = true
    }
}
