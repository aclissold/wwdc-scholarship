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

class InterestsViewController: UIViewController, AVAudioPlayerDelegate  {

    @IBOutlet var pieceButtons: [UIButton]!

    @IBOutlet weak var gravePlayPauseButton: UIButton!
    @IBOutlet weak var brassQuartetPlayPauseButton: UIButton!
    @IBOutlet weak var haikuPlayPauseButton: UIButton!

    func audioPlayerEndInterruption(player: AVAudioPlayer, withOptions flags: Int) {
        if UInt(flags) == AVAudioSessionInterruptionOptions.ShouldResume.rawValue  {
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
        if audioPlayers.gravePlayerPlaying {
            gravePlayPauseButton.setImage(UIImage(named: "Pause"), forState: .Normal)
        } else if audioPlayers.brassQuartetPlayerPlaying {
            brassQuartetPlayPauseButton.setImage(UIImage(named: "Pause"), forState: .Normal)
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "done:")
    }

    func done(sender: UIBarButtonItem) {
        navigationController?.performSegueWithIdentifier("unwindFromInterests", sender: self)
    }

    func theme() {
        for button in pieceButtons {
            button.setTitleColor(andrewClissoldRed, forState: .Normal)
        }
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return .LandscapeRight
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
        // TODO: refactor these into three different methods on the AudioPlayers class
        switch sender.tag {
        case 0: // Grave
            if audioPlayers.gravePlayerPlaying {
                audioPlayers.pauseGrave()
                gravePlayPauseButton.setImage(UIImage(named: "Play"), forState: .Normal)
            } else {
                audioPlayers.playGrave()
                brassQuartetPlayPauseButton.setImage(UIImage(named: "Play"), forState: .Normal)
                gravePlayPauseButton.setImage(UIImage(named: "Pause"), forState: .Normal)
            }
        case 1: // Brass Quartet?
            if audioPlayers.brassQuartetPlayerPlaying {
                audioPlayers.pauseBrassQuartet()
                brassQuartetPlayPauseButton.setImage(UIImage(named: "Play"), forState: .Normal)
            } else {
                audioPlayers.playBrassQuartet()
                gravePlayPauseButton.setImage(UIImage(named: "Play"), forState: .Normal)
                brassQuartetPlayPauseButton.setImage(UIImage(named: "Pause"), forState: .Normal)
            }
        case 2: // Haiku
            if audioPlayers.gravePlayerPlaying {
                audioPlayers.pauseGrave()
                gravePlayPauseButton.setImage(UIImage(named: "Play"), forState: .Normal)
            }
            if audioPlayers.brassQuartetPlayerPlaying {
                audioPlayers.pauseBrassQuartet()
                brassQuartetPlayPauseButton.setImage(UIImage(named: "Play"), forState: .Normal)
            }
            presentMoviePlayerViewControllerAnimated(audioPlayers.haikuPlayer)
        default:
            fatalError("unknown play/pause button tapped")
        }
    }

}
