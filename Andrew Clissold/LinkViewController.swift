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
        "itms://itunes.apple.com/us/app/oakland-post/id931152313?mt=8",
        "https://github.com/aclissold/mhacks",
        "http://oakland.edu",
        "http://ibm.com/design",
        "itms://itunes.apple.com/us/app/dominos-pizza-usa/id436491861?mt=8"
    ]

    @IBAction func linkButtonPressed(sender: UIBarButtonItem) {
        if let url = NSURL(string: links[sender.tag]) {
            UIApplication.sharedApplication().openURL(url)
        }
    }

}
