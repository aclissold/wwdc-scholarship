//
//  AudioPlayers.swift
//  Andrew Clissold
//
//  Created by Andrew Clissold on 4/26/15.
//  Copyright (c) 2015 Andrew Clissold. All rights reserved.
//

import AVFoundation

let audioPlayers = AudioPlayers()

class AudioPlayers {
    var gravePlayer: AVAudioPlayer!
    var brassQuartetPlayer: AVAudioPlayer!
    var haikuPlayer: HaikuPlayerViewController!

    init() {
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

}
