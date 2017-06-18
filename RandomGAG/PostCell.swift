//
//  PostCell.swift
//  RandomGAG
//
//  Created by Danny on 3/9/17.
//  Copyright © 2017 Danny. All rights reserved.
//

import UIKit
import Kingfisher

var cache = NSCache<AnyObject, AnyObject>()

class PostCell: UICollectionViewCell {
    var ws: WebService { return .shared }
    var post: Post! {
        didSet {
            imageView.image = nil
            loadImage()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(post: Post) {
        self.post = post
    }
    
    func loadImage() {
        guard let url = URL(string: post.imageURL) else { return }
        if URL(string: post.imageURL) == url {
            imageView.kf.setImage(with: url)
        }
        
//        if let cachedImage = cache.object(forKey: url as AnyObject) {
//            print("this \(url) cached")
//            self.imageView.image = cachedImage as? UIImage
//        } else {
//            DispatchQueue.global(qos: .utility).async {
//                print("enter bacground thread")
//                let content = NSData(contentsOf: url as URL)
//                DispatchQueue.main.async {
//                    print("back to main thread")
//                    self.imageView.image = UIImage(data: content! as Data)
//                    cache.setObject(UIImage(data: content! as Data)!, forKey: url as AnyObject)
//                }
//            }
//        }
        
        
    }
    
    func setupView() {
        //        spinner.translatesAutoresizingMaskIntoConstraints = false
        //        spinner.hidesWhenStopped = true
        
        addSubview(imageView)
        //        spinner.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        //        spinner.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
}
