//
//  MainViewController.swift
//  Andrew Clissold
//
//  Created by Andrew Clissold on 4/20/15.
//  Copyright (c) 2015 Andrew Clissold. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var projectsButton: UIButton!
    @IBOutlet weak var interestsButton: UIButton!
    @IBOutlet weak var skillsButton: UIButton!
    @IBOutlet weak var backgroundButton: UIButton!

    @IBOutlet weak var githubButton: UIButton!
    @IBOutlet weak var andrewClissoldButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!

    var isContactInfoShowing = false
    let animationDuration: NSTimeInterval = 0.4

    override func viewDidLayoutSubviews() {
        rotateFrames()
    }

    func rotateFrames() {
        var rotationTransform = CGAffineTransformIdentity

        rotationTransform = CGAffineTransformRotate(rotationTransform, CGFloat(M_PI_2))
        interestsButton.layer.transform = CATransform3DMakeAffineTransform(rotationTransform)

        rotationTransform = CGAffineTransformRotate(rotationTransform, CGFloat(M_PI_2))
        skillsButton.layer.transform = CATransform3DMakeAffineTransform(rotationTransform)

        rotationTransform = CGAffineTransformRotate(rotationTransform, CGFloat(M_PI_2))
        backgroundButton.layer.transform = CATransform3DMakeAffineTransform(rotationTransform)

        // Scoot the left and right buttons closer to the edge of the screen to match the top and bottom buttons.
        interestsButton.frame.origin.x -= (interestsButton.frame.size.height/2 - interestsButton.frame.size.width/4)
        backgroundButton.frame.origin.x += (backgroundButton.frame.size.height/2 - backgroundButton.frame.size.width/4)
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.Portrait.rawValue)
    }

    override func preferredInterfaceOrientationForPresentation() -> UIInterfaceOrientation {
        return .Portrait
    }

    @IBAction func unwindToMainViewController(segue: UIStoryboardSegue) {

    }

    // MARK: Contact Info

    @IBAction func contactInfoButtonTapped(sender: UIButton) {
        switch (sender) {
        case andrewClissoldButton:
            toggleContactInfo()
        case githubButton:
            let URL = NSURL(string: "https://github.com/aclissold")!
            UIApplication.sharedApplication().openURL(URL)
        case emailButton:
            let URL = NSURL(string: "mailto:andrewclissold@gmail.com")!
            UIApplication.sharedApplication().openURL(URL)
        default:
            fatalError("unexpected contact info button tapped")
        }
    }

    func toggleContactInfo() {
        if isContactInfoShowing {
            hideContactInfo()
        } else {
            showContactInfo()
        }
        isContactInfoShowing = !isContactInfoShowing
    }

    func hideContactInfo() {
        UIView.animateWithDuration(animationDuration) {
            self.githubButton.alpha = 0
            self.emailButton.alpha = 0
        }
    }

    func showContactInfo() {
        UIView.animateWithDuration(animationDuration) {
            self.githubButton.alpha = 1
            self.emailButton.alpha = 1
        }
    }

}
