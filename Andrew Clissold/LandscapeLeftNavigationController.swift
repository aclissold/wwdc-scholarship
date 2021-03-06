//
//  LandscapeLeftNavigationController.swift
//  Andrew Clissold
//
//  Created by Andrew Clissold on 4/21/15.
//  Copyright (c) 2015 Andrew Clissold. All rights reserved.
//

import UIKit

class LandscapeLeftNavigationController: UINavigationController {

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return .LandscapeLeft
    }

    override func preferredInterfaceOrientationForPresentation() -> UIInterfaceOrientation {
        return .LandscapeLeft
    }
   
}
