//
//  HaikuPlayerViewController.swift
//  Andrew Clissold
//
//  Created by Andrew Clissold on 4/26/15.
//  Copyright (c) 2015 Andrew Clissold. All rights reserved.
//

import MediaPlayer

class HaikuPlayerViewController: MPMoviePlayerViewController {

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.LandscapeRight.rawValue)
    }

    override func preferredInterfaceOrientationForPresentation() -> UIInterfaceOrientation {
        return .LandscapeRight
    }

}
