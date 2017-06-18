//
//  MainViewController.swift
//  RandomGAG
//
//  Created by Danny on 3/9/17.
//  Copyright © 2017 Danny. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private let reuseIdentifier = "PostCell"
    
    var ws: WebService { return .shared }
    
    var url: String = "http://9gag.com/girl"
    
    lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = UIColor(white:1, alpha:0)
        cv.isPagingEnabled = true
        cv.dataSource = self
        cv.delegate = self
        
        return cv
    }()
    
    let rightCornerButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 75)
        button.backgroundColor = .red
        button.titleLabel?.text = "Test"
        button.addTarget(self, action: #selector(loadNewImages), for: .touchUpInside)
        return button
    }()
    
    func loadNewImages() {
        print("load new images")
//        ws.getHTMLNoAlamo { [weak self] in
//            print("end")
//        }
        self.collection.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false

        view.backgroundColor = UIColor(red:0.23, green:0.22, blue:0.22, alpha:1.0)
        collection.register(PostCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        setupView()
         
//        ws.getHTMLNoAlamo { [weak self] in
//            self?.collection.reloadData()
//        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if ws.posts.isEmpty {
            print("no posts found")
            return 0
        } else {
            print(ws.posts.count)
            return ws.posts.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let post = collection.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PostCell
        post.configure(post: ws.posts[indexPath.row])
        
        return post
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == ws.posts.count - 1 {
            print("selected")
        } else {
            return
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collection.bounds.width
        let height = collection.bounds.height
//        let width = (collectionView.bounds.width / 2) - 28
//        let height = width * (4 / 3)
        return CGSize(width: width , height: height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func setupView() {
        view.addSubview(collection)
        view.addSubview(rightCornerButton)
        
        collection.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        collection.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        collection.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        collection.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
    }
    
}
