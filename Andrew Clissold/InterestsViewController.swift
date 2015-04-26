//
//  InterestsViewController.swift
//  Andrew Clissold
//
//  Created by Andrew Clissold on 4/21/15.
//  Copyright (c) 2015 Andrew Clissold. All rights reserved.
//

import UIKit

class InterestsViewController: UIViewController {

    let PDFs = [
        "showGravePDF": "Grave",
        "showBrassQuartet?PDF": "Brass Quartet?",
        "showHaikuPDF": "Haiku"
    ]

    override func viewDidLoad() {
        title = "Interests"
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.LandscapeRight.rawValue)
    }

    override func preferredInterfaceOrientationForPresentation() -> UIInterfaceOrientation {
        return .LandscapeRight
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            let viewController = segue.destinationViewController as! PDFViewController
            viewController.piece = PDFs[identifier]
        }
    }

}
