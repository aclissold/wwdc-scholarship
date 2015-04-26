//
//  LinkViewController.swift
//  Andrew Clissold
//
//  Created by Andrew Clissold on 4/25/15.
//  Copyright (c) 2015 Andrew Clissold. All rights reserved.
//

import UIKit

class LinkViewController: UIViewController {

    @IBOutlet weak var textView: UITextView?

    var didFixContentOffset = false

    let links = [
        "https://github.com/spamproject/spam",
        "itms://itunes.apple.com/us/app/oakland-post/id931152313?mt=8",
        "https://github.com/aclissold/typeonetwo",
        "http://oakland.edu",
        "http://ibm.com/design",
        "itms://itunes.apple.com/us/app/dominos-pizza-usa/id436491861?mt=8"
    ]

    override func viewDidLayoutSubviews() {
        if !didFixContentOffset {
            textView?.setContentOffset(CGPointZero, animated: false)
            didFixContentOffset = true
        }
    }

    @IBAction func linkButtonPressed(sender: UIBarButtonItem) {
        if let url = NSURL(string: links[sender.tag]) {
            UIApplication.sharedApplication().openURL(url)
        }
    }

}
