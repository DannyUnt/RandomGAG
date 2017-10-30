//
//  Test.swift
//  RandomGAG
//
//  Created by Danny on 4/30/17.
//  Copyright © 2017 Danny. All rights reserved.
//

import UIKit
import Kingfisher

class Test: UIViewController {
    private var gags = [UIView]()
    var vm: ViewModel!
    
    var ws: WebService { return .shared }
    var count: Int = 0
    var ind: Int = 0
    var reloadView: ReloadView!
    
    var container: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .purple
        return container
    }()
    
    func setupBar() {
        let barReloadButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(reloadDataFromURL))
        self.navigationItem.rightBarButtonItem = barReloadButton
    }
    
    func addView(index: Int) {
        let gag = Gag(post: ws.posts[index])
        gags.append(gag)
    }
    
    func confgiure() {
        gags.removeAll()
        count = ws.postsCount
        print("Number of girls \(count)")
        if count == 0 {
            return
        } else {
            for i in 0...count-1 {
                addView(index: i)
            }
        }
        gags.insert(reloadView, at: count)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupBar()

        reloadView = ReloadView()
        let start = Date()
        ws.getDataFromURL(with: "http://9gag.com/girl", completion: { [weak self] in
            self?.confgiure()
            self?.setupViews()
        })
        
    
        let end = Date()
        print("Time: \(end.timeIntervalSince(start))")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func reloadDataFromURL() {
        ind = 0
        
        
        ws.getDataFromURL(with: ws.reloadURL!, completion: {
            self.confgiure()
            for gagView in self.gags.reversed() {
                self.container.addSubview(gagView)
                gagView.translatesAutoresizingMaskIntoConstraints = false
                gagView.centerXAnchor.constraint(equalTo: self.container.centerXAnchor).isActive = true
                gagView.centerYAnchor.constraint(equalTo: self.container.centerYAnchor).isActive = true
                gagView.widthAnchor.constraint(equalTo: self.container.widthAnchor).isActive = true
                gagView.heightAnchor.constraint(equalTo: self.container.heightAnchor).isActive = true
            }
        })
        
    }
    
    func tapped() {
        print("Index \(ind)")
        if gags[ind].isKind(of: ReloadView.self) {
            //reloadDataFromURL()
            //gags[ind].removeFromSuperview()
            reloadView = nil
            
        }
        //else {
//        UIView.transition(from: gags[ind], to: gags[ind+1], duration: 0.5, options: [.transitionCurlUp])
//        gags[ind].removeFromSuperview()
//        ind = ind + 1
//        }
//        print("Index \(ind)")
        
        gags[ind].removeFromSuperview()
        gags.remove(at: ind)

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
