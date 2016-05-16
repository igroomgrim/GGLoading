//
//  ViewController.swift
//  GGLoadingExample
//
//  Created by Anak Mirasing on 5/16/16.
//  Copyright © 2016 iGROOMGRiM. All rights reserved.
//

import UIKit
import GGLoading

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Action
    @IBAction func showButtonTapped(sender: AnyObject) {
        GGLoadingView().show()
    }
    
}

