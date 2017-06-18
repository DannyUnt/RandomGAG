//
//  ViewModel.swift
//  RandomGAG
//
//  Created by Danny on 6/18/17.
//  Copyright © 2017 Danny. All rights reserved.
//

import UIKit

class ViewModel {
    let post: Post
    var posts: [UIView]
    
    var postURL: NSURL? {
        return NSURL(string: post.imageURL)
    }
    
    init(post: Post, posts: [UIView]) {
        self.post = post
        self.posts = posts
    }
}
