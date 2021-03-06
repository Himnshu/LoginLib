//
//  ViewController.swift
//  LoginLib
//
//  Created by himanshumahajan68@gmail.com on 07/29/2017.
//  Copyright (c) 2017 himanshumahajan68@gmail.com. All rights reserved.
//

import UIKit

import LoginLib

class ViewController: UIViewController {
    
    lazy var loginCoordinator: LoginCoordinator = {
        return LoginCoordinator(rootViewController: self)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loginCoordinator.start()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

