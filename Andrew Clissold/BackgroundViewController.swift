//
//  BackgroundViewController.swift
//  Andrew Clissold
//
//  Created by Andrew Clissold on 4/21/15.
//  Copyright (c) 2015 Andrew Clissold. All rights reserved.
//

import UIKit

class BackgroundViewController: UIViewController {

    var pageViewController: UIPageViewController!
    let dataSource = BackgroundDataSource()

    override func viewDidLoad() {
        title = "Background"
        setUpPageViewController()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "done:")
    }

    func done(sender: UIBarButtonItem) {
        navigationController?.performSegueWithIdentifier("unwindFromBackground", sender: self)
    }

    func setUpPageViewController() {
        dataSource.oaklandUniversityViewController = storyboard!.instantiateViewControllerWithIdentifier("OaklandUniversityViewController") as UIViewController
        dataSource.IBMDesignViewController = storyboard!.instantiateViewControllerWithIdentifier("IBMDesignViewController") as UIViewController
        dataSource.dominosViewController = storyboard!.instantiateViewControllerWithIdentifier("DominosViewController") as UIViewController

        pageViewController = storyboard!.instantiateViewControllerWithIdentifier("BackgroundPageViewController") as! UIPageViewController
        pageViewController.setViewControllers([dataSource.initialViewController], direction: .Forward, animated: true, completion: nil)
        pageViewController.dataSource = dataSource
        addChildViewController(pageViewController)
        view.addSubview(pageViewController.view)

        pageViewController.didMoveToParentViewController(self)
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}
