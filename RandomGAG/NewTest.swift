//
//  Test.swift
//  RandomGAG
//
//  Created by Danny on 4/30/17.
//  Copyright © 2017 Danny. All rights reserved.
//

import UIKit
import Kingfisher

class NewTest: UIViewController {
    private var gags = [UIView]()
    var reloadView: ReloadView!
    
    var vm: ViewModel!
    
    var container: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .purple
        return container
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        vm = ViewModel()
        reloadView = ReloadView()
        
        vm.fetchPosts { posts in
            self.confgiure(posts: posts)
            self.setupViews()
        }
 
    }
    
    func confgiure(posts: [Post]) {
        if posts.count != 0 {
            for i in 0...posts.count - 1 {
                let gag = Gag(post: posts[i])
                gags.append(gag)
            }
            gags.insert(reloadView, at: posts.count)
        }
    }

    func tapped() {
        if gags[0].isKind(of: ReloadView.self) {
            vm.fetchPosts { posts in
                self.confgiure(posts: posts)
                self.setupViews()
            }
            //gags[ind].removeFromSuperview()
            //reloadView = nil
        }

        
        gags[0].removeFromSuperview()
        
        for s in gags[0].subviews {
            s.removeFromSuperview()
        }
        gags.remove(at: 0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    func setupViews() {
        view.addSubview(container)
        container.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapped)))
        container.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        container.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        container.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        container.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        
        for gagView in gags.reversed() {
            container.addSubview(gagView)
            gagView.translatesAutoresizingMaskIntoConstraints = false
            gagView.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
            gagView.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
            gagView.widthAnchor.constraint(equalTo: container.widthAnchor).isActive = true
            gagView.heightAnchor.constraint(equalTo: container.heightAnchor).isActive = true
        }
        
    }
        

}
