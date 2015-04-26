//
//  AudioPlayers.swift
//  Andrew Clissold
//
//  Created by Andrew Clissold on 4/26/15.
//  Copyright (c) 2015 Andrew Clissold. All rights reserved.
//

import AVFoundation
import MediaPlayer

let audioPlayers = AudioPlayers()

class AudioPlayers: NSObject, AVAudioPlayerDelegate {
    var gravePlayer: AVAudioPlayer!
    var brassQuartetPlayer: AVAudioPlayer!
    var haikuPlayer: HaikuPlayerViewController!

    override init() {
        super.init()

        let gravePath = NSBundle.mainBundle().pathForResource("Grave", ofType: "mp3")!
        let brassQuartetPath = NSBundle.mainBundle().pathForResource("Brass Quartet?", ofType: "mp3")!
        let haikuPath = NSBundle.mainBundle().pathForResource("Haiku", ofType: "mp4")!

        let graveURL = NSURL(fileURLWithPath: gravePath)!
        let brassQuartetURL = NSURL(fileURLWithPath: brassQuartetPath)!
        let haikuURL = NSURL(fileURLWithPath: haikuPath)!

        gravePlayer = AVAudioPlayer(contentsOfURL: graveURL, fileTypeHint: AVFileTypeMPEGLayer3, error: nil)
        brassQuartetPlayer = AVAudioPlayer(contentsOfURL: brassQuartetURL, fileTypeHint: AVFileTypeMPEGLayer3, error: nil)
        haikuPlayer = HaikuPlayerViewController(contentURL: haikuURL)

        MPRemoteCommandCenter.sharedCommandCenter().pauseCommand.addTargetWithHandler { (event) -> MPRemoteCommandHandlerStatus in
            if self.gravePlayer.playing {
                self.gravePlayer.pause()
            }
            if self.brassQuartetPlayer.playing {
                self.brassQuartetPlayer.pause()
            }
            return .Success
        }
        MPRemoteCommandCenter.sharedCommandCenter().playCommand.addTargetWithHandler { (event) -> MPRemoteCommandHandlerStatus in
            if self.gravePlayer.playing {
                self.gravePlayer.play()
            } else if self.brassQuartetPlayer.playing {
                self.brassQuartetPlayer.play()
            }
            return .Success
        }
        MPRemoteCommandCenter.sharedCommandCenter().previousTrackCommand.enabled = false
        MPRemoteCommandCenter.sharedCommandCenter().nextTrackCommand.enabled = false
    }

}
