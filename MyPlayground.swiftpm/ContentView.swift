import SwiftUI
import AVKit

struct ContentView: View {
    @State var counter = 0
    
    var audioPlayer = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "menu", withExtension: "wav")!)
    var videoPlayer = AVPlayer(url: Bundle.main.url(forResource: "awesome", withExtension: "mov")!)
    
    var body: some View {
        NavigationView{
            ZStack{
                Image(uiImage: UIImage(named: "space.jpeg")!)
                   .resizable()
                   .edgesIgnoringSafeArea(.all)
                VStack{
                    VideoPlayer(player:videoPlayer)
                        .aspectRatio(CGSize(width: 1376, height: 630), contentMode: .fit)
                        .frame(width: 800)
                        .disabled(true)
                    Text("Hello, world!")
                        .font(.title)
                        .foregroundColor(.white)
                    Text("Count: \(counter)")
                    Button("Increase"){
                        counter += 1
                    }.buttonStyle(.borderedProminent)
                    NavigationLink(destination: SecondPage()){
                        Text("Navigate")
                    }.buttonStyle(.bordered)
                }
               .ignoresSafeArea()
           }
        }
        .navigationViewStyle(.stack)
        .onAppear{
            // Video
            videoPlayer.play()
            NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: nil, queue: .main) { _ in
                videoPlayer.seek(to: .zero)
                videoPlayer.play()
            }
            
            // Audio
            audioPlayer.play()
            audioPlayer.numberOfLoops = -1 // -1 for infinite lop
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
