//
//  PDFViewController.swift
//  Andrew Clissold
//
//  Created by Andrew Clissold on 4/25/15.
//  Copyright (c) 2015 Andrew Clissold. All rights reserved.
//

import UIKit

class PDFViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!

    var piece: String?

    override func viewDidLoad() {
        showPDF()
    }

    func showPDF() {
        let path = NSBundle.mainBundle().pathForResource(piece, ofType: "pdf")!
        let URL = NSURL(fileURLWithPath: path)!
        let request = NSURLRequest(URL: URL)
        webView.loadRequest(request)
    }

}
