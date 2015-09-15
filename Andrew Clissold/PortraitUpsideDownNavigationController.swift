//
//  PortraitUpsideDownNavigationController.swift
//  Andrew Clissold
//
//  Created by Andrew Clissold on 4/21/15.
//  Copyright (c) 2015 Andrew Clissold. All rights reserved.
//

import UIKit

class PortraitUpsideDownNavigationController: UINavigationController {

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return .PortraitUpsideDown
    }

    override func preferredInterfaceOrientationForPresentation() -> UIInterfaceOrientation {
        return .PortraitUpsideDown
    }

}
