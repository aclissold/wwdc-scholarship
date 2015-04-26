//
//  MainViewController.swift
//  Andrew Clissold
//
//  Created by Andrew Clissold on 4/20/15.
//  Copyright (c) 2015 Andrew Clissold. All rights reserved.
//

import UIKit

import AVFoundation
import CoreMotion

class MainViewController: UIViewController {

    @IBOutlet weak var projectsButton: UIButton!
    @IBOutlet weak var interestsButton: UIButton!
    @IBOutlet weak var skillsButton: UIButton!
    @IBOutlet weak var backgroundButton: UIButton!

    @IBOutlet weak var backdropView: UIView!

    @IBOutlet weak var contactInfoContainerView: UIView!
    @IBOutlet weak var githubButton: UIButton!
    @IBOutlet weak var andrewClissoldButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!

    let animationDuration: NSTimeInterval = 0.4
    let motionManager = CMMotionManager()
    let motionQueue = NSOperationQueue()

    var isContactInfoShowing = false
    var didCheckForSimulator = false
    var didUpdateContactInfoContainerViewCornerRadius = false

    override func viewDidLoad() {
        super.viewDidLoad()
        startDeviceMotionUpdates()
        setUpAudioSession()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if !didCheckForSimulator {
            checkForSimulator()
            didCheckForSimulator = true
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        rotateFrames()
        if !didUpdateContactInfoContainerViewCornerRadius {
            contactInfoContainerView.layer.cornerRadius = contactInfoContainerView.frame.size.width/2
            didUpdateContactInfoContainerViewCornerRadius = true
        }
    }

    func startDeviceMotionUpdates() {
        if !motionManager.deviceMotionAvailable {
            return
        }

        motionManager.startDeviceMotionUpdatesUsingReferenceFrame(.XArbitraryZVertical, toQueue: motionQueue) { (deviceMotion, error) in
            let angle = CGFloat(atan2(deviceMotion.gravity.x, deviceMotion.gravity.y) + M_PI)
            var rotationTransform = CGAffineTransformIdentity
            rotationTransform = CGAffineTransformRotate(rotationTransform, angle)

            dispatch_async(dispatch_get_main_queue()) {
                self.contactInfoContainerView.layer.transform = CATransform3DMakeAffineTransform(rotationTransform)
            }
        }
    }

    func setUpAudioSession() {
        AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, error: nil)
        AVAudioSession.sharedInstance().setActive(true, error: nil)
        UIApplication.sharedApplication().beginReceivingRemoteControlEvents()
    }

    func checkForSimulator() {
        if !motionManager.deviceMotionAvailable {
            let title = "Note"
            let message = "This app is not intended to be run in the simulator—it makes " +
                "use of device motion and the experience of holding a physical device."
            let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
            let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alert.addAction(action)
            presentViewController(alert, animated: true, completion: nil)
            return
        }
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
        isContactInfoShowing = !isContactInfoShowing

        UIView.animateWithDuration(animationDuration) {
            self.githubButton.alpha = self.isContactInfoShowing ? 1 : 0
            self.emailButton.alpha = self.isContactInfoShowing ? 1 : 0
            self.backdropView.alpha = self.isContactInfoShowing ? 0.8 : 0

            for button in [self.projectsButton, self.interestsButton, self.skillsButton, self.backgroundButton] {
                button.userInteractionEnabled = !self.isContactInfoShowing
            }
        }
    }

}
