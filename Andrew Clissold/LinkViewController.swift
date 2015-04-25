//
//  LinkViewController.swift
//  Andrew Clissold
//
//  Created by Andrew Clissold on 4/25/15.
//  Copyright (c) 2015 Andrew Clissold. All rights reserved.
//

import UIKit

class LinkViewController: UIViewController {

    let links = [
        "https://github.com/spamproject/spam",
        "https://github.com/aclissold/the-oakland-post",
        "https://github.com/aclissold/mhacks"
    ]

    @IBAction func linkButtonPressed(sender: UIBarButtonItem) {
        if let url = NSURL(string: links[sender.tag]) {
            UIApplication.sharedApplication().openURL(url)
        }
    }

}
