//
//  NetworkManager.swift
//  RandomGAG
//
//  Created by Danny on 6/18/17.
//  Copyright © 2017 Danny. All rights reserved.
//

import UIKit
import SwiftSoup

class NetworkManager {
    var baseURL: String = "http://9gag.com/girl"
    
    private var reload: String = ""
    var reloadURL: String? {
        get {
            return reload
        }
        set {
            self.reload =  newValue!
        }
    }
    
    
    func getDataFromURL(with url: String, completion: @escaping ([Post])->()) {
        if let u = URL(string: url) {
            DispatchQueue.global(qos: .utility).async {
                let data = try! String(contentsOf: u)
                DispatchQueue.main.async {
                    completion(self.parse(data))
                }
            }
        }
    }
    
    func parse(_ html: String)  -> [Post]{
        var posts = [Post]()
        let doc: Document = try! SwiftSoup.parse(html)
        let images: Elements = try! doc.select("img.badge-item-img")
        for link: Element in images.array() {
            let post = Post(imageURL: try! link.attr("src"))
            posts.append(post)
        }
        let more: Element = try! doc.getElementsByClass("btn badge-load-more-post").first()!
        reloadURL = try! more.attr("href")
        
        return posts
    }

}
