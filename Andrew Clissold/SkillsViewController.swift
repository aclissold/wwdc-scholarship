//
//  SkillsViewController.swift
//  Andrew Clissold
//
//  Created by Andrew Clissold on 4/21/15.
//  Copyright (c) 2015 Andrew Clissold. All rights reserved.
//

import UIKit

class SkillsViewController: UIViewController {

    override func viewDidLoad() {
        title = "Skills"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "done:")
    }

    func done(sender: UIBarButtonItem) {
        navigationController?.performSegueWithIdentifier("unwindFromSkills", sender: self)
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }


}
