//
//  SkillsViewController.swift
//  Andrew Clissold
//
//  Created by Andrew Clissold on 4/21/15.
//  Copyright (c) 2015 Andrew Clissold. All rights reserved.
//

import UIKit
import Foundation

class SkillsViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        title = "Skills"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "done:")
    }

    override func viewDidAppear(animated: Bool) {
        let textWidth = (textView.text! as NSString).boundingRectWithSize(textView.frame.size,
            options: .UsesLineFragmentOrigin,
            attributes: [NSFontAttributeName: UIFont(name: "Menlo", size: 14)!],
            context: nil).size.width
        textView.contentInset = UIEdgeInsetsZero
        scrollView.contentSize.width = textWidth
        scrollView.contentInset = UIEdgeInsetsZero
    }

    func done(sender: UIBarButtonItem) {
        navigationController?.performSegueWithIdentifier("unwindFromSkills", sender: self)
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }


}
