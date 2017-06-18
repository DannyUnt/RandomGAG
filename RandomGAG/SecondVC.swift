//
//  SecondVC.swift
//  RandomGAG
//
//  Created by Danny on 3/8/17.
//  Copyright © 2017 Danny. All rights reserved.
//

import UIKit

protocol LocationDelegate: class {
    func thirdVCOpened()
}

class SecondVC: UIViewController, LocationDelegate {
    let thirdvc = ThirdVC()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        
        thirdvc.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.pushViewController(thirdvc, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func thirdVCWasOpened() {
        dismiss(animated: false, completion: nil)
    }
    
    func thirdVCOpened() {
        thirdvc.iamonscreen()
        thirdVCWasOpened()
    }
    
}
