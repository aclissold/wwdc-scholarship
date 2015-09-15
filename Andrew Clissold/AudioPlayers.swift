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
    private var gravePlayer: AVAudioPlayer!
    private var brassQuartetPlayer: AVAudioPlayer!
    var gravePlayerPlaying: Bool {
        return gravePlayer.playing
    }
    var brassQuartetPlayerPlaying: Bool {
        return brassQuartetPlayer.playing
    }

    var haikuPlayer: HaikuPlayerViewController!

    var mostRecentPlayer: AVAudioPlayer?

    override init() {
        super.init()

        let gravePath = NSBundle.mainBundle().pathForResource("Grave", ofType: "mp3")!
        let brassQuartetPath = NSBundle.mainBundle().pathForResource("Brass Quartet?", ofType: "mp3")!
        let haikuPath = NSBundle.mainBundle().pathForResource("Haiku", ofType: "mp4")!

        let graveURL = NSURL(fileURLWithPath: gravePath)
        let brassQuartetURL = NSURL(fileURLWithPath: brassQuartetPath)
        let haikuURL = NSURL(fileURLWithPath: haikuPath)

        do {
            gravePlayer = try AVAudioPlayer(contentsOfURL: graveURL, fileTypeHint: AVFileTypeMPEGLayer3)
        } catch _ {
            gravePlayer = nil
        }
        do {
            brassQuartetPlayer = try AVAudioPlayer(contentsOfURL: brassQuartetURL, fileTypeHint: AVFileTypeMPEGLayer3)
        } catch _ {
            brassQuartetPlayer = nil
        }
        haikuPlayer = HaikuPlayerViewController(contentURL: haikuURL)

        MPRemoteCommandCenter.sharedCommandCenter().playCommand.addTargetWithHandler { (event) -> MPRemoteCommandHandlerStatus in
            if let mostRecentPlayer = self.mostRecentPlayer {
                mostRecentPlayer.play()
            }
            return .Success
        }
        MPRemoteCommandCenter.sharedCommandCenter().pauseCommand.addTargetWithHandler { (event) -> MPRemoteCommandHandlerStatus in
            if self.gravePlayer.playing {
                self.gravePlayer.pause()
            }
            if self.brassQuartetPlayer.playing {
                self.brassQuartetPlayer.pause()
            }
            return .Success
        }
        MPRemoteCommandCenter.sharedCommandCenter().previousTrackCommand.enabled = false
        MPRemoteCommandCenter.sharedCommandCenter().nextTrackCommand.enabled = false
    }

    func playGrave() {
        brassQuartetPlayer.stop()
        gravePlayer.play()
        mostRecentPlayer = gravePlayer
        MPNowPlayingInfoCenter.defaultCenter().nowPlayingInfo = [
            MPMediaItemPropertyTitle: "Grave",
            MPMediaItemPropertyArtist: "Andrew Clissold",
            MPNowPlayingInfoPropertyPlaybackRate: 1
        ]
    }

    func pauseGrave() {
        gravePlayer.pause()
    }

    func playBrassQuartet() {
        gravePlayer.stop()
        brassQuartetPlayer.play()
        mostRecentPlayer = brassQuartetPlayer
        MPNowPlayingInfoCenter.defaultCenter().nowPlayingInfo = [
            MPMediaItemPropertyTitle: "Brass Quartet?",
            MPMediaItemPropertyArtist: "Andrew Clissold",
            MPNowPlayingInfoPropertyPlaybackRate: 1
        ]
    }

    func pauseBrassQuartet() {
        brassQuartetPlayer.pause()
    }

}
