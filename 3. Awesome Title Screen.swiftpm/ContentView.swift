import SwiftUI
import AVKit

struct ContentView: View {
    var audioPlayer = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "menu", withExtension: "wav")!)
    var videoPlayer = AVPlayer(url: Bundle.main.url(forResource: "awesome", withExtension: "mov")!)
    var body: some View {
        ZStack{
            Image(uiImage: UIImage(named: "space.jpeg")!)
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                VideoPlayer(player:videoPlayer)
                    .aspectRatio(CGSize(width: 1376, height: 630), contentMode: .fit)
                    .frame(width: 800)
                    .disabled(true)
            }
            .ignoresSafeArea()
        }
        .onAppear{
            // Video
            videoPlayer.play()
            NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: nil, queue: .main) { _ in
                videoPlayer.seek(to: .zero)
                videoPlayer.play()
            }
            
            // Audio
            audioPlayer.play()
            audioPlayer.numberOfLoops = - 1 // -1 for infinite lop
        }
    }
}
