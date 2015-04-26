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
        if audioPlayers.gravePlayer.playing {
            gravePlayPauseButton.setImage(UIImage(named: "Pause"), forState: .Normal)
        } else if audioPlayers.brassQuartetPlayer.playing {
            brassQuartetPlayPauseButton.setImage(UIImage(named: "Pause"), forState: .Normal)
        }
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

    @IBAction func playPause(sender: UIButton) {
        // TODO: refactor these into three different methods on the AudioPlayers class
        switch sender.tag {
        case 0: // Grave
            if audioPlayers.gravePlayer.playing {
                audioPlayers.gravePlayer.pause()
                gravePlayPauseButton.setImage(UIImage(named: "Play"), forState: .Normal)
                MPNowPlayingInfoCenter.defaultCenter().nowPlayingInfo = [:]
            } else {
                brassQuartetPlayPauseButton.setImage(UIImage(named: "Play"), forState: .Normal)
                audioPlayers.brassQuartetPlayer.stop()
                gravePlayPauseButton.setImage(UIImage(named: "Pause"), forState: .Normal)
                audioPlayers.gravePlayer.play()
                MPNowPlayingInfoCenter.defaultCenter().nowPlayingInfo = [
                    MPMediaItemPropertyTitle: "Grave",
                    MPMediaItemPropertyArtist: "Andrew Clissold",
                    MPNowPlayingInfoPropertyPlaybackRate: 1
                ]
            }
        case 1: // Brass Quartet?
            if audioPlayers.brassQuartetPlayer.playing {
                audioPlayers.brassQuartetPlayer.pause()
                brassQuartetPlayPauseButton.setImage(UIImage(named: "Play"), forState: .Normal)
                MPNowPlayingInfoCenter.defaultCenter().nowPlayingInfo = [:]
            } else {
                gravePlayPauseButton.setImage(UIImage(named: "Play"), forState: .Normal)
                audioPlayers.gravePlayer.stop()
                brassQuartetPlayPauseButton.setImage(UIImage(named: "Pause"), forState: .Normal)
                audioPlayers.brassQuartetPlayer.play()
                MPNowPlayingInfoCenter.defaultCenter().nowPlayingInfo = [
                    MPMediaItemPropertyTitle: "Brass Quartet?",
                    MPMediaItemPropertyArtist: "Andrew Clissold",
                    MPNowPlayingInfoPropertyPlaybackRate: 1
                ]
            }
        case 2: // Haiku
            if audioPlayers.gravePlayer.playing {
                audioPlayers.gravePlayer.stop()
                gravePlayPauseButton.setImage(UIImage(named: "Play"), forState: .Normal)
            }
            if audioPlayers.brassQuartetPlayer.playing {
                audioPlayers.brassQuartetPlayer.stop()
                brassQuartetPlayPauseButton.setImage(UIImage(named: "Play"), forState: .Normal)
            }
            presentMoviePlayerViewControllerAnimated(audioPlayers.haikuPlayer)
        default:
            fatalError("unknown play/pause button tapped")
        }
    }

}
