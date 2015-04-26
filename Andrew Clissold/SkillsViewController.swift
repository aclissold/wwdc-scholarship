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

    @IBOutlet var scrollViews: [UIScrollView]!
    @IBOutlet var textViews: [UITextView]!

    override func viewDidLoad() {
        title = "Skills"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "done:")
    }

    override func viewDidAppear(animated: Bool) {
        setUpHorizontalScrollViews()
    }

    func setUpHorizontalScrollViews() {
        for i in 0..<count(scrollViews) {
            let textWidth = (textViews[i].text! as NSString).boundingRectWithSize(textViews[i].frame.size,
                options: .UsesLineFragmentOrigin,
                attributes: [NSFontAttributeName: UIFont(name: "Menlo", size: 14)!],
                context: nil).size.width
            textViews[i].contentInset = UIEdgeInsetsZero
            scrollViews[i].contentSize.width = textWidth
            scrollViews[i].contentInset = UIEdgeInsetsZero
        }
    }

    func done(sender: UIBarButtonItem) {
        navigationController?.performSegueWithIdentifier("unwindFromSkills", sender: self)
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }


}
