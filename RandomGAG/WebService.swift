//
//  WebService.swift
//  RandomGAG
//
//  Created by Danny on 3/8/17.
//  Copyright © 2017 Danny. All rights reserved.
//

import Foundation
import SwiftSoup


class WebService {
    static let shared = WebService()
    var baseURL: String = "http://9gag.com"
    var section: String = "/girl"
    
    var postsCount: Int {
        return posts.count
    }
    private(set) var posts = [Post]()
    
    
    private var reload: String = ""
    var reloadURL: String? {
        get {
            return reload
        }
        set {
            self.reload = baseURL + newValue!
        }
    }

    func getHTMLNoAlamo() {
        if reload.isEmpty {
            getDataFromURL(with: baseURL+section, completion: {
                print("base url data loaded")
            })
        } else {
            posts.removeAll()
            getDataFromURL(with: reload) {
                print("shit")
            }
        }
    }
    
    func getDataFromURL(with url: String, completion: @escaping ()->()) {
        if !posts.isEmpty {
            posts.removeAll()
        }
        if let u = URL(string: url) {
            DispatchQueue.global(qos: .utility).async {
                let data = try! String(contentsOf: u)
                self.parse(html: data)
                DispatchQueue.main.async {
                    completion()
                }
            }
         }
    }
    
    func parse(html: String) {
        let doc: Document = try! SwiftSoup.parse(html)
        let images: Elements = try! doc.select("img.badge-item-img")
        for link: Element in images.array() {
            let post = Post(imageURL: try! link.attr("src"))
            posts.append(post)
        }
        let more: Element = try! doc.getElementsByClass("btn badge-load-more-post").first()!
        reloadURL = try! more.attr("href")
    }
}
