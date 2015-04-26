//
//  InterestsViewController.swift
//  Andrew Clissold
//
//  Created by Andrew Clissold on 4/21/15.
//  Copyright (c) 2015 Andrew Clissold. All rights reserved.
//

import UIKit
import AVFoundation

class InterestsViewController: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet var pieceButtons: [UIButton]!
    var audioPlayer: AVAudioPlayer!

    func audioPlayerEndInterruption(player: AVAudioPlayer!, withOptions flags: Int) {
        if UInt(flags) == AVAudioSessionInterruptionOptions.OptionShouldResume.rawValue  {
            player.play()
        }
    }

    let PDFs = [
        "showGravePDF": "Grave",
        "showBrassQuartet?PDF": "Brass Quartet?",
        "showHaikuPDF": "Haiku"
    ]

    override func viewDidLoad() {
        title = "Interests"
        theme()

        let path = NSBundle.mainBundle().pathForResource("Grave", ofType: "mp3")!
        let URL = NSURL(fileURLWithPath: path)!
        audioPlayer = AVAudioPlayer(contentsOfURL: URL, fileTypeHint: AVFileTypeMPEGLayer3, error: nil)
        audioPlayer.delegate = self
    }

    func theme() {
        for button in pieceButtons {
            button.setTitleColor(andrewClissoldRed, forState: .Normal)
        }
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

    @IBAction func play(sender: AnyObject) {
        audioPlayer.play()
    }
    @IBAction func pause(sender: AnyObject) {
        audioPlayer.pause()
    }

}
