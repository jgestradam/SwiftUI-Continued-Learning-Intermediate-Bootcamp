//
//  SoundsBootcamp.swift
//  SwiftUI Continued Learning Intermediate Bootcamp
//
//  Created by Joseph Estrada on 12/1/22.
//

import SwiftUI
import AVKit

class SoundManager {
    // Singleton
    // Crea una instancia unida del soundmanager, lo inicializamos una vez aqui y luego, cada vez que queramos usar nuestro sound manager accedemos a el a traves de esta instancia.
    // De esta manera lo creamos una vez para toda nuestra aplicacion en vez de inicializar uno nuevo en cada pantalla.
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
        case tada
        case badum
    }
    
    func playSound(sound: SoundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error{
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
}

struct SoundsBootcamp: View {

    var body: some View {
        VStack(spacing: 40) {
            Button("Play sound ") {
                SoundManager.instance.playSound(sound: .tada)
            }
            Button("Play sound ") {
                SoundManager.instance.playSound(sound: .badum)
            }
        }
    }
}

struct SoundsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SoundsBootcamp()
    }
}
