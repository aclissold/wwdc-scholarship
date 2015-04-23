//
//  BackgroundViewController.swift
//  Andrew Clissold
//
//  Created by Andrew Clissold on 4/21/15.
//  Copyright (c) 2015 Andrew Clissold. All rights reserved.
//

import UIKit

class BackgroundViewController: UIViewController {

    override func viewDidLoad() {
        title = "Background"
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}
