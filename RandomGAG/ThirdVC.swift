//
//  ThirdVC.swift
//  RandomGAG
//
//  Created by Danny on 3/8/17.
//  Copyright © 2017 Danny. All rights reserved.
//

import UIKit

class ThirdVC: UIViewController {
    weak var delegate: LocationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        delegate?.thirdVCOpened()
    }
    

    func iamonscreen() {
        print("i am on screen")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
