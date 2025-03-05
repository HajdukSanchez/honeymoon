//
//  PlaySound.swift
//  Honeymoon
//
//  Created by Jozek Andrzej Hajduk Sanchez on 5/03/25.
//

import AVFoundation

private var audioPlayer: AVAudioPlayer?

func playSound(name: String, type: String) {
    if let path = Bundle.main.path(forResource: name, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Error: Could not find and play the sound file")
        }
    }
}
