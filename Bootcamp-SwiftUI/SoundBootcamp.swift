//
//  SoundBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/19.
//

import SwiftUI
import AVKit

struct SoundBootcamp: View {
    
    var body: some View {
        VStack(spacing: 40) {
            Button("Play Sound 1") {
                SoundManager.instance.playSound(sound: .tada)
            }
            
            Button("Play Sound 2") {
                SoundManager.instance.playSound(sound: .badum)
            }
        }
    }
}

class SoundManager {
    
    // Singleton
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    enum SoundOption: String  {
        case tada
        case badum
    }
    
    func playSound(sound: SoundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
        
    }
    
}
    
#Preview {
    SoundBootcamp()
}
