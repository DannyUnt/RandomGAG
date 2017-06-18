//
//  Gag.swift
//  RandomGAG
//
//  Created by Danny on 4/30/17.
//  Copyright © 2017 Danny. All rights reserved.
//

import UIKit
import Kingfisher

class Gag: UIView {
    var post: Post? {
        didSet {
            girlView.image = nil
            loadImage()
        }
    }
    
    deinit {
        print("Gag removed from view controller")
    }
    
    var girlView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.backgroundColor = .black
        return image
    }()

    init(post: Post) {
        super.init(frame: CGRect(x: 50, y: 50, width: 150, height: 150))
        self.backgroundColor = .red
        self.configure(post: post)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configure(post: Post) {
        self.post = post
    }
    
    func loadImage() {
        guard let url = URL(string: (post?.imageURL)!) else { return }
        self.girlView.kf.setImage(with: url, options: [.forceRefresh])
    }
    
    func setupView() {
        self.addSubview(girlView)
        girlView.translatesAutoresizingMaskIntoConstraints = false
        girlView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        girlView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        girlView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        girlView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }

}
