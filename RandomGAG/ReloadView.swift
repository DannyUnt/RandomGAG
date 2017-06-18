//
//  ReloadView.swift
//  RandomGAG
//
//  Created by Danny on 6/4/17.
//  Copyright © 2017 Danny. All rights reserved.
//

import UIKit

class ReloadView: UIView {
//    var girlView: UIImageView = {
//        let image = UIImageView()
//        image.translatesAutoresizingMaskIntoConstraints = false
//        image.contentMode = .scaleAspectFit
//        image.clipsToBounds = true
//        image.backgroundColor = .blue
//        return image
//    }()
//    
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        self.backgroundColor = .blue
//        setupView()
    }
    
    deinit {
        print("Reload view deleted")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

//    func setupView() {
//        self.addSubview(girlView)
//        girlView.translatesAutoresizingMaskIntoConstraints = false
//        girlView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        girlView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//        girlView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
//        girlView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
//    }
}
