//
//  ViewController.swift
//  RandomGAG
//
//  Created by Danny on 3/8/17.
//  Copyright © 2017 Danny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(button)
        button.center = view.center
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    let button: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("tap me", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.frame = CGRect(x: 0, y: 0, width: 50, height: 20)
        btn.backgroundColor = .green
        btn.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        return btn
    }()
    
    func tapped() {
        present(UINavigationController(rootViewController: SecondVC()), animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

