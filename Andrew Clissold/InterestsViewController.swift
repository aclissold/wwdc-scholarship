//
//  InterestsViewController.swift
//  Andrew Clissold
//
//  Created by Andrew Clissold on 4/21/15.
//  Copyright (c) 2015 Andrew Clissold. All rights reserved.
//

import UIKit

import AVFoundation
import MediaPlayer

class InterestsViewController: UIViewController  {

    @IBOutlet var pieceButtons: [UIButton]!

    @IBOutlet weak var gravePlayPauseButton: UIButton!
    @IBOutlet weak var brassQuartetPlayPauseButton: UIButton!
    @IBOutlet weak var haikuPlayPauseButton: UIButton!

    var gravePlayer: AVAudioPlayer!
    var brassQuartetPlayer: AVAudioPlayer!
    var haikuPlayer: HaikuPlayerViewController!

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
        setUpAudioPlayers()
    }

    func theme() {
        for button in pieceButtons {
            button.setTitleColor(andrewClissoldRed, forState: .Normal)
        }
    }

    func setUpAudioPlayers() {
        let gravePath = NSBundle.mainBundle().pathForResource("Grave", ofType: "mp3")!
        let brassQuartetPath = NSBundle.mainBundle().pathForResource("Brass Quartet?", ofType: "mp3")!
        let haikuPath = NSBundle.mainBundle().pathForResource("Haiku", ofType: "mp4")!

        let graveURL = NSURL(fileURLWithPath: gravePath)!
        let brassQuartetURL = NSURL(fileURLWithPath: brassQuartetPath)!
        let haikuURL = NSURL(fileURLWithPath: haikuPath)!

        gravePlayer = AVAudioPlayer(contentsOfURL: graveURL, fileTypeHint: AVFileTypeMPEGLayer3, error: nil)
        brassQuartetPlayer = AVAudioPlayer(contentsOfURL: brassQuartetURL, fileTypeHint: AVFileTypeMPEGLayer3, error: nil)
        haikuPlayer = HaikuPlayerViewController(contentURL: haikuURL)
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

    @IBAction func playPause(sender: UIButton) {
        switch sender.tag {
        case 0: // Grave
            if gravePlayer.playing {
                gravePlayer.pause()
                gravePlayPauseButton.setImage(UIImage(named: "Play"), forState: .Normal)
            } else {
                brassQuartetPlayPauseButton.setImage(UIImage(named: "Play"), forState: .Normal)
                brassQuartetPlayer.stop()
                gravePlayPauseButton.setImage(UIImage(named: "Pause"), forState: .Normal)
                gravePlayer.play()
            }
        case 1: // Brass Quartet?
            if brassQuartetPlayer.playing {
                brassQuartetPlayer.pause()
                brassQuartetPlayPauseButton.setImage(UIImage(named: "Play"), forState: .Normal)
            } else {
                gravePlayPauseButton.setImage(UIImage(named: "Play"), forState: .Normal)
                gravePlayer.stop()
                brassQuartetPlayPauseButton.setImage(UIImage(named: "Pause"), forState: .Normal)
                brassQuartetPlayer.play()
            }
        case 2: // Haiku
            if gravePlayer.playing {
                gravePlayer.stop()
                gravePlayPauseButton.setImage(UIImage(named: "Play"), forState: .Normal)
            }
            if brassQuartetPlayer.playing {
                brassQuartetPlayer.stop()
                brassQuartetPlayPauseButton.setImage(UIImage(named: "Play"), forState: .Normal)
            }
            NSNotificationCenter.defaultCenter().addObserver(self,
                selector: "movieFinished:", name: MPMoviePlayerPlaybackDidFinishNotification, object: nil)
            presentMoviePlayerViewControllerAnimated(haikuPlayer)
        default:
            fatalError("unknown play/pause button tapped")
        }
    }

    func movieFinished(notification: NSNotification) {

    }

}
