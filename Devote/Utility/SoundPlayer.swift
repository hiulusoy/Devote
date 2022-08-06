//
//  SoundPlayer.swift
//  Devote
//
//  Created by Halil Usanmaz on 6.08.2022.
//

import Foundation
import AVFAudio

var audioPlayer: AVAudioPlayer?;

func playSound(sound: String?, type: String?){
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        }
        catch {
            print("Couldn't find and play the sound file!")
        }
    }
}
